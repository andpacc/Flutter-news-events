import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/entities/models/video.dart';

class PlayVideoDetails extends StatelessWidget {
  final Video video;
  const PlayVideoDetails({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          video.title,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Share.share(video.markdown),
              padding: const EdgeInsets.all(5),
              icon: const Icon(
                Icons.share_outlined,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Markdown(data: video.markdown),
      ),
    );
  }
}
