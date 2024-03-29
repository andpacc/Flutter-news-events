// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:example/domain/entities/models/categories_music.dart';
import 'package:example/domain/entities/models/music.dart';
import 'package:example/presentation/pages/play/music_play/search_music_delegate.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/widgets/custom_appbar.dart';
import 'package:example/presentation/widgets/custom_category.dart';
import 'package:example/presentation/widgets/row_categorias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'music_bloc/play_music_bloc.dart';

class PlayMusicCategorias extends StatelessWidget {
  const PlayMusicCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final miBusqueda = await showSearch(
                      context: context,
                      delegate: SearchMusicDelegate(
                          categories:
                              state.playMusicStateData.musicCategories));
                  if (miBusqueda is CategoryMusic) {
                    // ignore: use_build_context_synchronously
                    BlocProvider.of<PlayMusicBloc>(context)
                        .add(CategorySelectionEvent(
                      miBusqueda.id,
                      true,
                    ));
                  }
                },
              ),
              IconButton(
                onPressed: () => BlocProvider.of<PlayMusicBloc>(context)
                    .add(ResetCategoryEvent()),
                icon: const Icon(Icons.refresh_outlined),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: CustomCategoryList(
                        categories: state.playMusicStateData.musicCategories,
                        itemBuilder: (context, category) => RowCategorias(
                              onChanged: (value) =>
                                  BlocProvider.of<PlayMusicBloc>(context)
                                      .add(CategorySelectionEvent(
                                category.id,
                                value!,
                              )),
                              name: category.name,
                              selectedContainsCategoria: state
                                  .playMusicStateData.selectedCategories
                                  .contains(category.id),
                            ))),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    List<Music> filteredMusicList =
                        state.playMusicStateData.selectedCategories.isEmpty
                            ? state.playMusicStateData.musicList
                            : state.playMusicStateData.musicList.where((music) {
                                return state
                                    .playMusicStateData.selectedCategories
                                    .contains(music.categoria);
                              }).toList();
                    GoRouter.of(context).replace("${AppRoutes.play.path}/music",
                        extra: filteredMusicList);
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
