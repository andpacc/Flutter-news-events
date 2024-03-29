import 'package:example/domain/entities/models/music.dart';
import 'package:example/domain/entities/models/video.dart';
import 'package:example/presentation/pages/play/music_play/play_music_card.dart';
import 'package:example/presentation/pages/play/video_play/play_video_card.dart';
import 'package:example/presentation/pages/play/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayCards extends StatelessWidget {
  final Music song1;
  final Music song2;
  final Video video1;
  final String musicPath;
  final String videoPath;
  final String musicDetailsPath;
  final String videoDetailsPath;
  final List<Video> filteredVideosList;
  final List<Music> filteredMusicList;
  const PlayCards({
    super.key,
    required this.song1,
    required this.song2,
    required this.video1,
    required this.musicPath,
    required this.videoPath,
    required this.filteredVideosList,
    required this.filteredMusicList,
    required this.musicDetailsPath,
    required this.videoDetailsPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Column(
          children: [
            TitleText(
                title: "VIDEOS",
                onTap: () => GoRouter.of(context)
                    .go(videoPath, extra: filteredVideosList)),
            const SizedBox(height: 10),
            VideoCard(
              videoDetailsPath: videoDetailsPath,
              video: video1,
            ),
          ],
        ),
        Column(
          children: [
            TitleText(
                title: "MUSICA",
                onTap: () => GoRouter.of(context)
                    .go(musicPath, extra: filteredMusicList)),
          ],
        ),
        Flexible(
          child: MusicCards(
            musicDetailsPath: musicDetailsPath,
            song1: song1,
            song2: song2,
          ),
        ),
      ],
    );
  }
}
