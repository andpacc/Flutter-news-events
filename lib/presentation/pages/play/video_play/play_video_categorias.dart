import 'package:example/domain/entities/models/video.dart';
import 'package:example/presentation/pages/play/video_play/video_bloc/play_video_bloc.dart';
import 'package:example/presentation/pages/play/video_play/video_search_delegate.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/widgets/custom_category.dart';
import 'package:example/presentation/widgets/row_categorias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/models/categories_video.dart';

class PlayVideoCategories extends StatelessWidget {
  const PlayVideoCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayVideoBloc, PlayVideoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("CATEGORIAS"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final miBusqueda = await showSearch(
                      context: context,
                      delegate: SearchVideoDelegate(
                          categories: state.videoStateData.videoCategories));
                  if (miBusqueda is CategoryVideo) {
                    // ignore: use_build_context_synchronously
                    BlocProvider.of<PlayVideoBloc>(context)
                        .add(CategoryVideoSelectionEvent(
                      miBusqueda.id,
                      true,
                    ));
                  }
                },
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<PlayVideoBloc>(context)
                      .add(ResetVideoCategoryEvent());
                },
                icon: const Icon(Icons.refresh_outlined),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: CustomCategoryList(
                        categories: state.videoStateData.videoCategories,
                        itemBuilder: (context, category) => RowCategorias(
                              onChanged: (value) =>
                                  BlocProvider.of<PlayVideoBloc>(context)
                                      .add(CategoryVideoSelectionEvent(
                                category.id,
                                value!,
                              )),
                              name: category.name,
                              selectedContainsCategoria: state
                                  .videoStateData.selectedVideo
                                  .contains(category.id),
                            ))),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    List<Video> filteredVideoList =
                        state.videoStateData.selectedVideo.isEmpty
                            ? state.videoStateData.videoList
                            : state.videoStateData.videoList.where((video) {
                                return state.videoStateData.selectedVideo
                                    .contains(video.categoria);
                              }).toList();

                    GoRouter.of(context).replace('${AppRoutes.play.path}/video',
                        extra: filteredVideoList);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Text(
                      "Aceptar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
