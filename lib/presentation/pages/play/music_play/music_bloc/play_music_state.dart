// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'play_music_bloc.dart';

class PlayMusicStateData {
  final List<Music> musicList;
  final List<int> selectedCategories;
  final List<CategoryMusic> musicCategories;
  final List<Music> selectedMusic;

  const PlayMusicStateData(
      {this.selectedCategories = const [],
      this.musicList = const [],
      this.musicCategories = const [],
      this.selectedMusic = const []});

  PlayMusicStateData copyWith({
    List<Music>? musicList,
    List<int>? selectedCategories,
    List<CategoryMusic>? musicCategories,
    List<Music>? selectedMusic,
  }) {
    return PlayMusicStateData(
        musicList: musicList ?? this.musicList,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        musicCategories: musicCategories ?? this.musicCategories,
        selectedMusic: selectedMusic ?? this.selectedMusic);
  }
}

abstract class PlayMusicState {
  final PlayMusicStateData playMusicStateData;
  const PlayMusicState({required this.playMusicStateData});
}

class PlayMusicLoadedState extends PlayMusicState {
  PlayMusicLoadedState({required super.playMusicStateData});
}

class PlayMusicInitialState extends PlayMusicState {
  const PlayMusicInitialState(
      {super.playMusicStateData = const PlayMusicStateData()});
}

class PlayMusicErrorState extends PlayMusicState {
  final String message;

  PlayMusicErrorState(
      {required super.playMusicStateData, required this.message});
}
