import 'package:example/domain/entities/models/video.dart';
import 'package:example/presentation/pages/play/video_play/play_video_card.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PlayVideoPage extends StatelessWidget {
  final List<Video> filteredVideoList;

  const PlayVideoPage({
    super.key,
    required this.filteredVideoList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(FontAwesomeIcons.youtube))
        ],
      ),
      body: ListView.builder(
          itemCount: filteredVideoList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: VideoCard(
                  videoDetailsPath: '${AppRoutes.play.path}/video/details',
                  video: filteredVideoList[index],
                ));
          }),
      floatingActionButton: FloatingActionButton(
        key: const Key("video"),
        backgroundColor: primaryColor(context),
        elevation: 10,
        onPressed: () {
          GoRouter.of(context)
              .replace('${AppRoutes.play.path}/video/categoryVideo');
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
