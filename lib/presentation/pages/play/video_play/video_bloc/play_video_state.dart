// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'play_video_bloc.dart';

class PlayVideoStateData {
  final List<Video> videoList;
  final List<int> selectedVideo;
  final List<CategoryVideo> videoCategories;
  final List<Video> filteredVideo;

  const PlayVideoStateData(
      {this.selectedVideo = const [],
      this.videoCategories = const [],
      this.videoList = const [],
      this.filteredVideo = const []});

  PlayVideoStateData copyWith({
    List<Video>? videoList,
    List<int>? selectedVideo,
    List<CategoryVideo>? videoCategories,
    List<Video>? filteredVideo,
  }) {
    return PlayVideoStateData(
        videoList: videoList ?? this.videoList,
        selectedVideo: selectedVideo ?? this.selectedVideo,
        videoCategories: videoCategories ?? this.videoCategories,
        filteredVideo: filteredVideo ?? this.filteredVideo);
  }
}

@immutable
abstract class PlayVideoState {
  final PlayVideoStateData videoStateData;
  const PlayVideoState({required this.videoStateData});
}

class PlayVideoInitialState extends PlayVideoState {
  const PlayVideoInitialState(
      {super.videoStateData = const PlayVideoStateData()});
}

class PlayVideoErrorState extends PlayVideoState {
  final String message;
  const PlayVideoErrorState(
      {required super.videoStateData, required this.message});
}

class PlayVideoLoadedState extends PlayVideoState {
  const PlayVideoLoadedState({required super.videoStateData});
}
