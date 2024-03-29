import 'dart:core'
    if (dart.library.html) 'dart:html'
    if (dart.library.io) 'dart:io';

import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/domain/entities/models/music.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/domain/entities/models/video.dart';
import 'package:example/error/error_page.dart';
import 'package:example/presentation/pages/agenda/agenda_categorias.dart';
import 'package:example/presentation/pages/agenda/agenda_details.dart';
import 'package:example/presentation/pages/agenda/agenda_filters.dart';
import 'package:example/presentation/pages/agenda/agenda_page.dart';
import 'package:example/presentation/pages/agenda/agenda_suggestion.dart';
import 'package:example/presentation/pages/chat/chat_page.dart';
import 'package:example/presentation/pages/favoritos/favoritos.dart';
import 'package:example/presentation/pages/maps/map_event_places.dart';
import 'package:example/presentation/pages/maps/map_page.dart';
import 'package:example/presentation/pages/noticias/noticias.dart';
import 'package:example/presentation/pages/noticias/noticias_categorias.dart';
import 'package:example/presentation/pages/noticias/noticias_details.dart';
import 'package:example/presentation/pages/play/music_play/play_music_categorias.dart';
import 'package:example/presentation/pages/play/music_play/play_music_details.dart';
import 'package:example/presentation/pages/play/music_play/play_music_page.dart';
import 'package:example/presentation/pages/play/play_page.dart';
import 'package:example/presentation/pages/play/video_play/play_video_categorias.dart';
import 'package:example/presentation/pages/play/video_play/play_video_details.dart';
import 'package:example/presentation/pages/play/video_play/play_video_page.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:example/widgets/info.dart';
import 'package:example/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteProvider {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Offset topBotton = const Offset(0, -1);
  static Offset bottonTop = const Offset(0, 1);
  static Offset rightLeft = const Offset(1, 0);
  static Offset leftRight = const Offset(-1, 0);

  static NavigatorState get navigate {
    return navigatorKey.currentState!;
  }

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.agenda.path,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.agenda.path,
                name: AppRoutes.agenda.name,
                builder: (BuildContext context, GoRouterState state) =>
                    RootScreen(
                        label: AppRoutes.agenda.name,
                        onPressed: () => GoRouter.of(context)
                            .go('${AppRoutes.agenda.path}/filters'),
                        widget: AgendaPage(
                            filteredAgenda: state.extra as List<Agenda>?,
                            detailsPath: '${AppRoutes.agenda.path}/details')),
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoutes.agendaDetails.path,
                    name: AppRoutes.agendaDetails.name,
                    builder: (BuildContext context, GoRouterState state) =>
                        DetailsAgenda(agenda: state.extra as Agenda),
                  ),
                  GoRoute(
                      path: AppRoutes.agendaFilters.path,
                      name: AppRoutes.agendaFilters.name,
                      builder: (BuildContext context, GoRouterState state) =>
                          const AgendaFilters(),
                      routes: <RouteBase>[
                        GoRoute(
                          path: AppRoutes.agendaFiltersCategory.path,
                          builder: (context, state) => const AgendaCategorias(),
                        )
                      ]),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.map.path,
                name: AppRoutes.map.name,
                builder: (BuildContext context, GoRouterState state) =>
                    RootScreen(
                        label: AppRoutes.map.name,
                        widget: MapPage(
                          lugarEventos: state.extra as LugarEventos?,
                          lugarEventosPath: "${AppRoutes.map.path}/places",
                        )),
                routes: <RouteBase>[
                  GoRoute(
                    path: '${AppRoutes.mapPlaces.path}/:id',
                    builder: (context, state) {
                      final lugarId = state.pathParameters['id'];

                      return MapaEventosLugares(
                        lugarId: lugarId!,
                        lugar: state.extra as LugarEventos?,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.noticias.path,
                name: AppRoutes.noticias.name,
                builder: (BuildContext context, GoRouterState state) =>
                    RootScreen(
                        onPressed: () => GoRouter.of(context)
                            .go('${AppRoutes.noticias.path}/categoryNoticias'),
                        label: AppRoutes.noticias.name,
                        widget: NoticiasPage(
                            listaFiltrada: state.extra as List<Titular>?,
                            detailsPath: '${AppRoutes.noticias.path}/details')),
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoutes.noticiasDetails.path,
                    name: AppRoutes.noticiasDetails.name,
                    builder: (BuildContext context, GoRouterState state) =>
                        DetailsNoticias(
                      noticia: state.extra as Titular,
                    ),
                  ),
                  GoRoute(
                    path: AppRoutes.noticiasCategorias.path,
                    name: AppRoutes.noticiasCategorias.name,
                    builder: (BuildContext context, GoRouterState state) =>
                        const NoticiasCategories(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.favoritos.path,
                name: AppRoutes.favoritos.name,
                builder: (BuildContext context, GoRouterState state) =>
                    RootScreen(
                        label: AppRoutes.favoritos.name,
                        widget: FavoritosPage(
                          detailsPathAgenda: '${AppRoutes.agenda.path}/details',
                          detailsPathNoticias:
                              '${AppRoutes.noticias.path}/details',
                        )),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.play.path,
                name: AppRoutes.play.name,
                builder: (BuildContext context, GoRouterState state) =>
                    RootScreen(
                  label: AppRoutes.play.name,
                  widget: PlayPage(
                    musicPath: '${AppRoutes.play.path}/music',
                    videoPath: '${AppRoutes.play.path}/video',
                    musicDetailsPath: '${AppRoutes.play.path}/music/details',
                    videoDetailsPath: '${AppRoutes.play.path}/video/details',
                  ),
                ),
                routes: <RouteBase>[
                  GoRoute(
                      path: AppRoutes.video.path,
                      name: AppRoutes.video.name,
                      builder: (BuildContext context, GoRouterState state) =>
                          PlayVideoPage(
                            filteredVideoList: state.extra as List<Video>,
                          ),
                      routes: <RouteBase>[
                        GoRoute(
                          path: AppRoutes.videosDetails.path,
                          name: AppRoutes.videosDetails.name,
                          builder: (context, state) =>
                              PlayVideoDetails(video: state.extra as Video),
                        ),
                        GoRoute(
                          path: AppRoutes.categoryVideo.path,
                          name: AppRoutes.categoryVideo.name,
                          builder: (context, state) =>
                              const PlayVideoCategories(),
                        ),
                      ]),
                  GoRoute(
                      path: AppRoutes.music.path,
                      name: AppRoutes.music.name,
                      builder: (BuildContext context, GoRouterState state) =>
                          PlayMusicPage(
                              filteredMusicList: state.extra as List<Music>),
                      routes: <RouteBase>[
                        GoRoute(
                          path: AppRoutes.musicDetails.path,
                          name: AppRoutes.musicDetails.name,
                          builder: (context, state) =>
                              PlayMusicDetails(music: state.extra as Music),
                        ),
                        GoRoute(
                          path: AppRoutes.categoryMusic.path,
                          name: AppRoutes.categoryMusic.name,
                          builder: (context, state) =>
                              const PlayMusicCategorias(),
                        )
                      ])
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
          path: AppRoutes.infoPage.path,
          builder: (context, state) => const InfoPage(),
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.chatPage.path,
              name: AppRoutes.chatPage.name,
              builder: (BuildContext context, GoRouterState state) =>
                  const ChatPage(),
            ),
            GoRoute(
              path: AppRoutes.agendaSuggestions.path,
              name: AppRoutes.agendaSuggestions.name,
              builder: (BuildContext context, GoRouterState state) =>
                  const SuggestEventScreen(),
            ),
          ])
    ],
    errorPageBuilder: (context, state) {
      return fadeAnimation(
        context: context,
        state: state,
        page: const ErrorPage(),
      );
    },
  );
  static CustomTransitionPage fadeAnimation({
    required BuildContext context,
    required GoRouterState state,
    required Widget page,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var opacityAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeIn,
        );
        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }
}

class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen({
    required this.label,
    this.detailsPath,
    this.secondDetailsPath,
    required this.widget,
    this.onPressed,
    super.key,
  });

  final String label;
  final String? detailsPath;
  final String? secondDetailsPath;
  final Widget widget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          title: RichText(
            text: buildColoredTextSpan("nmpnu"),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => GoRouter.of(context).push(
                    AppRoutes.infoPage.path,
                  ),
                )),
          ]),
      body: widget,
      floatingActionButton: onPressed != null
          ? FloatingActionButton(
              heroTag: null,
              backgroundColor: primaryColor(context),
              elevation: 10,
              onPressed: onPressed,
              child: const Icon(Icons.search),
            )
          : null,
    );
  }
}

TextSpan buildColoredTextSpan(String text) {
  List<TextSpan> spans = [];

  for (int i = 0; i < text.length; i++) {
    bool isIndexEven = i % 2 == 0;

    spans.add(
      TextSpan(
        text: text[i],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isIndexEven ? Colors.white : Colors.redAccent[700]!,
          fontSize: 30,
        ),
      ),
    );
  }

  return TextSpan(children: spans);
}
