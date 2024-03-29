import 'package:example/domain/entities/models/music.dart';
import 'package:example/presentation/pages/play/widgets/info_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MusicCards extends StatelessWidget {
  final Music song1;
  final Music song2;
  final String musicDetailsPath;
  const MusicCards(
      {super.key,
      required this.song1,
      required this.song2,
      required this.musicDetailsPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ImageCustomView(
            musicDetailsPath: musicDetailsPath,
            music: song1,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
            marginLeft: 3,
            marginRight: 4,
          ),
        ),
        Flexible(
          child: ImageCustomView(
            musicDetailsPath: musicDetailsPath,
            music: song2,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
            marginLeft: 4,
            marginRight: 3,
          ),
        )
      ],
    );
  }
}

class ImageCustomView extends StatelessWidget {
  final Music music;
  final BorderRadius borderRadius;
  final double marginLeft;
  final double marginRight;
  final String musicDetailsPath;
  const ImageCustomView({
    super.key,
    required this.music,
    required this.borderRadius,
    required this.marginLeft,
    required this.marginRight,
    required this.musicDetailsPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 0, top: 20, left: marginLeft, right: marginRight),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => launchUrlString(music.video),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(music.foto),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    music.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                InfoButton(
                    onTap: () => GoRouter.of(context)
                        .push(musicDetailsPath, extra: music)),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              music.autor,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
