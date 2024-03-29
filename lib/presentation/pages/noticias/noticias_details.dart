import 'package:example/domain/entities/models/titular.dart';
import 'package:example/presentation/pages/noticias/bloc/noticias_bloc.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class DetailsNoticias extends StatelessWidget {
  final Titular noticia;
  const DetailsNoticias({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.titulo),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).replace(
              AppRoutes.noticias.path,
            );
          },
        ),
        actions: [
          BlocBuilder<NoticiaBloc, NoticiaState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    state.stateData.titularesFav.contains(noticia)
                        ? context
                            .read<NoticiaBloc>()
                            .add(ClearFavNoticiasEvent(noticia))
                        : context
                            .read<NoticiaBloc>()
                            .add(AddFavNoticiaEvent(titular: noticia));
                  },
                  padding: const EdgeInsets.all(5),
                  icon: Icon(
                    state.stateData.titularesFav.contains(noticia)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ));
            },
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Share.share(noticia.markdown);
              },
              padding: const EdgeInsets.all(5),
              icon: const Icon(
                Icons.share_outlined,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Markdown(data: noticia.markdown),
      ),
    );
  }
}
