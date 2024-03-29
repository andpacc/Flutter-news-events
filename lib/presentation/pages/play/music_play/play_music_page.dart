import 'package:example/domain/entities/models/music.dart';
import 'package:example/presentation/pages/play/music_play/play_music_card.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PlayMusicPage extends StatelessWidget {
  final List<Music> filteredMusicList;

  const PlayMusicPage({
    super.key,
    required this.filteredMusicList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(FontAwesomeIcons.spotify))
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: filteredMusicList.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? ImageCustomView(
                  musicDetailsPath: '${AppRoutes.play.path}/music/details',
                  music: filteredMusicList[index],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  marginLeft: 16,
                  marginRight: 8,
                )
              : ImageCustomView(
                  musicDetailsPath: '${AppRoutes.play.path}/music/details',
                  music: filteredMusicList[index],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  marginLeft: 8,
                  marginRight: 16,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key("music"),
        backgroundColor: primaryColor(context),
        elevation: 10,
        child: const Icon(Icons.search),
        onPressed: () {
          GoRouter.of(context)
              .replace('${AppRoutes.play.path}/music/categoryMusic');
        },
      ),
    );
  }
}
