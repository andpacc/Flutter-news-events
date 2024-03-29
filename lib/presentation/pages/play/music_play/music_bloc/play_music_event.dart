part of 'play_music_bloc.dart';

abstract class PlayMusicEvent {}

class InitializeMusicEvent extends PlayMusicEvent {}

class CategorySelectionEvent extends PlayMusicEvent {
  final int categoryId;
  final bool isSelected;

  CategorySelectionEvent(this.categoryId, this.isSelected);
}

class ResetCategoryEvent extends PlayMusicEvent {}
