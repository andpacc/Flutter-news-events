import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/domain/usecases/get_video.usecase.dart';
import 'package:example/domain/usecases/get_videos_category_usecases.dart';
import 'package:example/presentation/utils/extensions/easy_fold.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/models/categories_video.dart';
import '../../../../../domain/entities/models/video.dart';

part 'play_video_event.dart';
part 'play_video_state.dart';

@injectable
class PlayVideoBloc extends Bloc<PlayVideoEvent, PlayVideoState> {
  final GetVideoUseCase getVideoUseCase;
  final GetVideosCategoryUseCase getVideosCategoryUseCase;
  PlayVideoStateData get stateData => state.videoStateData;

  PlayVideoBloc(this.getVideoUseCase, this.getVideosCategoryUseCase)
      : super(const PlayVideoInitialState()) {
    on<InitializeVideoEvent>(_onInitializeVideoEvent);
    on<ResetVideoCategoryEvent>(_onResetVideoCategoryEvent);
    on<CategoryVideoSelectionEvent>(_onVideoCategorySelectionEvent);
  }

  FutureOr<void> _onInitializeVideoEvent(
      InitializeVideoEvent event, Emitter<PlayVideoState> emit) async {
    final result = await getVideoUseCase(GetVideoUseCaseParams());
    final result2 =
        await getVideosCategoryUseCase(GetVideosCategoryUseCaseParams());

    result.fold((l) {
      emit(PlayVideoErrorState(
          videoStateData: stateData,
          message: l.msg ?? "Error en el VideoBloc"));
    }, (r) {
      emit(PlayVideoLoadedState(
          videoStateData: stateData.copyWith(
        videoList: r,
        videoCategories: result2.rightValue,
      )));
    });
  }

  void _onVideoCategorySelectionEvent(
      CategoryVideoSelectionEvent event, Emitter<PlayVideoState> emit) {
    final List<int> selectedCategories =
        List<int>.from(stateData.selectedVideo);
    event.isSelected
        ? selectedCategories.add(event.categoryId)
        : selectedCategories.remove(event.categoryId);

    emit(PlayVideoLoadedState(
        videoStateData: stateData.copyWith(selectedVideo: selectedCategories)));
  }

  void _onResetVideoCategoryEvent(
      ResetVideoCategoryEvent event, Emitter<PlayVideoState> emit) {
    emit(PlayVideoLoadedState(
        videoStateData: stateData.copyWith(selectedVideo: [])));
  }
}
