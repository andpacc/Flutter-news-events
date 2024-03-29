// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/device/repositories/local_storage.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/domain/usecases/get_news.dart';
import 'package:example/domain/usecases/get_news_category_usecase.dart';
import 'package:example/domain/usecases/get_news_favs.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/models/categories_titulares.dart';

part 'noticias_event.dart';
part 'noticias_state.dart';

@injectable
class NoticiaBloc extends Bloc<NoticiasEvent, NoticiaState> {
  final GetNewsUseCase getNewsUseCase;
  final AddFavsNewsUseCase addFavsNewsUseCase;
  final ClearAllFavsNewsUseCase clearAllFavsNewsUseCase;
  final ClearFavsNewsUseCase clearFavsNewsUseCase;
  final GetFavsNewsUseCase getFavsNewsUseCase;
  final GetNewsCategoryUseCase getNewsCategoryUseCase;
  final LocalStorage localStorage;
  NoticiaStateData get stateData => state.stateData;

  NoticiaBloc(
    this.getNewsUseCase,
    this.addFavsNewsUseCase,
    this.clearAllFavsNewsUseCase,
    this.clearFavsNewsUseCase,
    this.getFavsNewsUseCase,
    this.getNewsCategoryUseCase,
    this.localStorage,
  ) : super(const NoticiaInitialState()) {
    on<InitializeNoticiasEvent>(_onInitializeNewsEvent);
    on<AddFavNoticiaEvent>(_onAddNewsFavEvent);
    on<ClearAllFavsNoticiasEvent>(_onClearAllNewsFavEvent);
    on<ClearFavNoticiasEvent>(_onClearNewFavEvent);
    on<GetNoticiasFavEvent>(_onGetNewsFavEvent);
    on<CategoryNewsSelectionEvent>(_onCategoryNewsSelectionEvent);
    on<ResetNewsCategoryEvent>(_onResetCategoryNewsEvent);
  }

  FutureOr<void> _onInitializeNewsEvent(
      InitializeNoticiasEvent event, Emitter<NoticiaState> emit) async {
    try {
      final newsResult = await getNewsUseCase(GetNewsUseCaseParams()).then(
          (value) => value.getOrElse(
              () => throw Exception("Error al obtener las noticias")));
      final newsFavResult = await getFavsNewsUseCase(GetFavsNewsUseCaseParams())
          .then((value) => value.getOrElse(() =>
              throw Exception("Error al obtener las noticias favoritos")));
      final newsCategories =
          await getNewsCategoryUseCase(GetNewsCategoryUseCaseParams()).then(
              (value) => value.getOrElse(
                  () => throw Exception("Error al obtener las categorias")));

      emit(NoticiaLoadedState(
          stateData: stateData.copyWith(
        titulares: newsResult,
        titularesFav: newsFavResult,
        categoriaTitulares: newsCategories,
      )));
    } catch (e) {
      emit(NoticiaErrorState(message: e.toString(), stateData: stateData));
    }
  }

  FutureOr<void> _onCategoryNewsSelectionEvent(
      CategoryNewsSelectionEvent event, Emitter<NoticiaState> emit) async {
    final List<int> selectedCategories =
        List<int>.from(stateData.selectedCategoriaTitulares);
    event.isSelected
        ? selectedCategories.add(event.categoryId)
        : selectedCategories.remove(event.categoryId);

    emit(NoticiaLoadedState(
        stateData: stateData.copyWith(
            selectedCategoriaTitulares: selectedCategories)));
  }

  FutureOr<void> _onAddNewsFavEvent(
      AddFavNoticiaEvent event, Emitter<NoticiaState> emit) async {
    final newsResult = await addFavsNewsUseCase(
        AddFavsNewsUseCaseParams(titular: event.titular));
    newsResult.fold((l) {
      emit(NoticiaErrorState(
          stateData: stateData,
          message: l.msg ?? "Error al añadir una notica a favoritos"));
    }, (r) {
      add(GetNoticiasFavEvent());
      emit(NoticiaLoadedState(stateData: stateData));
    });
  }

  FutureOr<void> _onClearAllNewsFavEvent(
      ClearAllFavsNoticiasEvent event, Emitter<NoticiaState> emit) async {
    final newsResult =
        await clearAllFavsNewsUseCase(ClearAllNewsFavsNewsUseCaseParams());
    newsResult.fold((l) {
      emit(NoticiaErrorState(
          stateData: stateData,
          message: l.msg ?? "Error al borrar las noticias favoritas"));
    }, (r) {
      add(GetNoticiasFavEvent());
      emit(NoticiaLoadedState(stateData: stateData));
    });
  }

  FutureOr<void> _onClearNewFavEvent(
      ClearFavNoticiasEvent event, Emitter<NoticiaState> emit) async {
    final newsResult = await clearFavsNewsUseCase(
        ClearFavsNewsUseCaseParams(titular: event.titular));
    newsResult.fold((l) {
      emit(NoticiaErrorState(
          stateData: stateData,
          message: l.msg ?? " Error al borrar el favorito"));
    }, (r) {
      add(GetNoticiasFavEvent());
      emit(NoticiaLoadedState(stateData: stateData));
    });
  }

  FutureOr<void> _onGetNewsFavEvent(
      GetNoticiasFavEvent event, Emitter<NoticiaState> emit) async {
    final newsResult = await getFavsNewsUseCase(GetFavsNewsUseCaseParams());
    newsResult.fold((l) {
      emit(NoticiaErrorState(
          stateData: stateData,
          message: l.msg ?? "Error al obtener las noticias favoritos"));
    }, (r) {
      emit(NoticiaLoadedState(stateData: stateData.copyWith(titularesFav: r)));
    });
  }

  FutureOr<void> _onResetCategoryNewsEvent(
      ResetNewsCategoryEvent event, Emitter<NoticiaState> emit) {
    emit(NoticiaLoadedState(
        stateData: stateData.copyWith(selectedCategoriaTitulares: [])));
  }
}
