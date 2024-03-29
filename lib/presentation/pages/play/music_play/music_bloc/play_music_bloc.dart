import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/domain/usecases/get_music_category_usecase.dart';
import 'package:example/domain/usecases/get_music_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/models/categories_music.dart';
import '../../../../../domain/entities/models/music.dart';

part 'play_music_event.dart';
part 'play_music_state.dart';

@injectable
class PlayMusicBloc extends Bloc<PlayMusicEvent, PlayMusicState> {
  final GetMusicUseCase getMusicUseCase;
  final GetMusicCategoryUseCase getMusicCategoryUseCase;
  PlayMusicBloc(this.getMusicUseCase, this.getMusicCategoryUseCase)
      : super(const PlayMusicInitialState()) {
    on<InitializeMusicEvent>(_onPlayMusicInitialEvent);
    on<CategorySelectionEvent>(_onCategorySelectionEvent);
    on<ResetCategoryEvent>(_onResetCategoryEvent);
  }

  PlayMusicStateData get stateData => state.playMusicStateData;

  FutureOr<void> _onPlayMusicInitialEvent(
      InitializeMusicEvent event, Emitter<PlayMusicState> emit) async {
    List<Music>? music;
    List<CategoryMusic>? categoryMusic;
    final result = await getMusicUseCase(GetMusicUseCaseParams());
    final result2 =
        await getMusicCategoryUseCase(GetMusicCategoryUseCaseParams());

    result.fold((l) {
      emit(PlayMusicErrorState(
          playMusicStateData: stateData,
          message: l.msg ?? "Error al inicializar los datos"));
    }, (r) {
      music = r;
    });

    result2.fold((l) {
      emit(PlayMusicErrorState(
          playMusicStateData: stateData,
          message: l.msg ?? "Error al inicializar los datos"));
    }, (r) {
      categoryMusic = r;
    });
    if (music != null && categoryMusic != null) {
      emit(PlayMusicLoadedState(
          playMusicStateData: stateData.copyWith(
        musicList: music,
        musicCategories: categoryMusic,
      )));
    }
  }

  void _onCategorySelectionEvent(
      CategorySelectionEvent event, Emitter<PlayMusicState> emit) {
    final List<int> selectedCategories =
        List<int>.from(stateData.selectedCategories);
    event.isSelected
        ? selectedCategories.add(event.categoryId)
        : selectedCategories.remove(event.categoryId);

    emit(PlayMusicLoadedState(
        playMusicStateData:
            stateData.copyWith(selectedCategories: selectedCategories)));
  }

  void _onResetCategoryEvent(
      ResetCategoryEvent event, Emitter<PlayMusicState> emit) {
    emit(PlayMusicLoadedState(
        playMusicStateData: stateData.copyWith(selectedCategories: [])));
  }
}
