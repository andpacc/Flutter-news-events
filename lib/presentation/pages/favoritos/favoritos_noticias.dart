import 'package:example/di/dependecy_injector.dart';
import 'package:example/presentation/pages/favoritos/favoritos_notfound.dart';
import 'package:example/presentation/pages/noticias/bloc/noticias_bloc.dart';
import 'package:example/presentation/pages/noticias/noticias_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritosNoticias extends StatelessWidget {
  final String detailsPath;
  const FavoritosNoticias({super.key, required this.detailsPath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NoticiaBloc>()..add(InitializeNoticiasEvent()),
      child: BlocBuilder<NoticiaBloc, NoticiaState>(
        builder: (context, state) {
          if (state is NoticiaInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NoticiaErrorState) {
            final mensaje = state.message;
            return Center(
              child: Text(mensaje),
            );
          } else {
            return CustomFavoritosStackNoticias(
              detailsPath: detailsPath,
            );
          }
        },
      ),
    );
  }
}

class CustomFavoritosStackNoticias extends StatelessWidget {
  final String detailsPath;
  const CustomFavoritosStackNoticias({
    super.key,
    required this.detailsPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocBuilder<NoticiaBloc, NoticiaState>(
          builder: (context, state) {
            final titularesFavs = state.stateData.titularesFav;

            if (titularesFavs.isEmpty) {
              return const NoFavouriteItem();
            }
            return ListView.builder(
              itemCount: titularesFavs.length,
              itemBuilder: (context, index) {
                final item = titularesFavs[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: NoticiaCard(
                      onTap: () =>
                          GoRouter.of(context).go(detailsPath, extra: item),
                      titular: item,
                      isFavourite: titularesFavs.contains(item)),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
