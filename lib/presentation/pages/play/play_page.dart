import 'package:example/di/dependecy_injector.dart';
import 'package:example/domain/entities/models/music.dart';
import 'package:example/domain/entities/models/video.dart';
import 'package:example/presentation/pages/play/music_play/music_bloc/play_music_bloc.dart';
import 'package:example/presentation/pages/play/play_cards.dart';
import 'package:example/presentation/pages/play/video_play/video_bloc/play_video_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayPage extends StatelessWidget {
  final String musicPath;
  final String videoPath;
  final String musicDetailsPath;
  final String videoDetailsPath;
  const PlayPage(
      {super.key,
      required this.musicPath,
      required this.videoPath,
      required this.musicDetailsPath,
      required this.videoDetailsPath});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PlayMusicBloc>()..add(InitializeMusicEvent()),
        ),
        BlocProvider(
          create: (context) => sl<PlayVideoBloc>()..add(InitializeVideoEvent()),
        ),
      ],
      child: BlocBuilder<PlayVideoBloc, PlayVideoState>(
          builder: (context, videoState) {
        List<Video> filteredVideoList = videoState.videoStateData.videoList;

        return BlocBuilder<PlayMusicBloc, PlayMusicState>(
            builder: (context, musicState) {
          List<Music> filteredMusicList =
              musicState.playMusicStateData.musicList;
          if (videoState is PlayVideoInitialState ||
              musicState is PlayMusicInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (videoState is PlayVideoErrorState &&
              musicState is PlayMusicErrorState) {
            String mensajeVideo = videoState.message;
            String mensajeMusic = musicState.message;
            return Scaffold(
              body: Column(
                children: [
                  Center(
                    child: Text(mensajeVideo),
                  ),
                  Center(
                    child: Text(mensajeMusic),
                  )
                ],
              ),
            );
          } else {
            List<Music> listMusic =
                List.from(musicState.playMusicStateData.musicList);
            Music song1 = listMusic[0];
            Music song2 = listMusic[1];
            List<Video> listVid =
                List.from(videoState.videoStateData.videoList);
            Video video1 = listVid[0];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlayCards(
                  musicDetailsPath: musicDetailsPath,
                  videoDetailsPath: videoDetailsPath,
                  song1: song1,
                  song2: song2,
                  video1: video1,
                  musicPath: musicPath,
                  videoPath: videoPath,
                  filteredVideosList: filteredVideoList,
                  filteredMusicList: filteredMusicList),
            );
          }
        });
      }),
    );
  }
}
