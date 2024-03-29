import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/entities/models/music.dart';

class PlayMusicDetails extends StatelessWidget {
  final Music music;
  const PlayMusicDetails({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Share.share(music.markdown),
              icon: const Icon(
                Icons.share_outlined,
              ),
            ),
          )
        ],
        title: Text(
          music.title,
        ),
      ),
      body: Center(
        child: Markdown(data: music.markdown),
      ),
    );
  }
}
