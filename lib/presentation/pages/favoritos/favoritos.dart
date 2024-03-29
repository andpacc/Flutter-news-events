import 'package:example/presentation/pages/favoritos/favoritos_agenda.dart';
import 'package:example/presentation/pages/favoritos/favoritos_noticias.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  final String detailsPathNoticias;
  final String detailsPathAgenda;
  const FavoritosPage({
    super.key,
    required this.detailsPathNoticias,
    required this.detailsPathAgenda,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Material(
            child: TabBar(
              indicatorColor: primaryColor(context),
              tabs: [
                Tab(
                  child: Text(
                    'Eventos',
                    style: TextStyle(
                      fontSize: 18,
                      color: primaryColor(context),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Noticias',
                    style: TextStyle(
                      fontSize: 18,
                      color: primaryColor(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                FavoritosEventos(detailsPath: detailsPathAgenda),
                FavoritosNoticias(
                  detailsPath: detailsPathNoticias,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
