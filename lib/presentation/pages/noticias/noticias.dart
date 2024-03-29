import 'package:example/di/dependecy_injector.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/presentation/pages/noticias/noticias_card.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/noticias_bloc.dart';

class NoticiasPage extends StatelessWidget {
  final String detailsPath;
  final List<Titular>? listaFiltrada;
  const NoticiasPage(
      {super.key, required this.detailsPath, this.listaFiltrada});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NoticiaBloc>()..add(InitializeNoticiasEvent()),
      child: _NoticiasContent(detailsPath, listaFiltrada),
    );
  }
}

class _NoticiasContent extends StatelessWidget {
  final String detailsPath;
  final List<Titular>? listaFiltrada;
  const _NoticiasContent(this.detailsPath, this.listaFiltrada);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoticiaBloc, NoticiaState>(
      builder: (context, state) {
        final noticiasFav = state.stateData.titularesFav;
        if (state is NoticiaInitialState) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                child: Container(
                  height: 250,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          );
        } else if (state is NoticiaErrorState) {
          String mensaje = state.message;
          return Scaffold(
            body: Center(
              child: Text(mensaje),
            ),
          );
        } else {
          return CustomStackNoticias(
            detailsPath: detailsPath,
            favs: noticiasFav,
            noticias: listaFiltrada != null
                ? listaFiltrada!
                : state.stateData.titulares,
          );
        }
      },
    );
  }
}

class CustomStackNoticias extends StatelessWidget {
  final List<Titular> noticias;
  final List<Titular> favs;
  final String detailsPath;
  const CustomStackNoticias(
      {super.key,
      required this.noticias,
      required this.favs,
      required this.detailsPath});

  Future<void> _handleRefresh(BuildContext context) async {
    BlocProvider.of<NoticiaBloc>(context).add(InitializeNoticiasEvent());
    return await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LiquidPullToRefresh(
            onRefresh: () => _handleRefresh(context),
            color: primaryColor(context),
            animSpeedFactor: 10,
            showChildOpacityTransition: false,
            child: ListView.builder(
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final item = noticias[index];
                const BouncingScrollPhysics();
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  child: NoticiaCard(
                      onTap: () => GoRouter.of(context)
                          .replace(detailsPath, extra: item),
                      titular: item,
                      isFavourite: favs.contains(item)),
                );
              },
            ))
      ],
    );
  }
}
