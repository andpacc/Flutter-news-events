part of 'play_video_bloc.dart';

abstract class PlayVideoEvent {}

class InitializeVideoEvent extends PlayVideoEvent {}

class CategoryVideoSelectionEvent extends PlayVideoEvent {
  final int categoryId;
  final bool isSelected;

  CategoryVideoSelectionEvent(this.categoryId, this.isSelected);
}

class ResetVideoCategoryEvent extends PlayVideoEvent {}
