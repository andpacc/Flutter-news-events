class AppRoutes {
  static const PageRoute agenda = PageRoute(name: "agenda", path: "/agenda");
  static const PageRoute agendaSuggestions =
      PageRoute(name: "sugestions", path: "suggestions");
  static const PageRoute agendaFilters =
      PageRoute(name: "filters", path: "filters");

  static const PageRoute map = PageRoute(name: "map", path: "/map");
  static const PageRoute mapPlaces =
      PageRoute(name: "mapPlaces", path: "places");
  static const PageRoute noticias =
      PageRoute(name: "noticias", path: "/noticias");
  static const PageRoute favoritos =
      PageRoute(name: "favoritos", path: "/favoritos");
  static const PageRoute play = PageRoute(name: "play", path: "/play");
  static const PageRoute music = PageRoute(name: "music", path: "music");
  static const PageRoute video = PageRoute(name: "video", path: "video");
  static const PageRoute agendaDetails =
      PageRoute(name: "agendaDetails", path: "details");
  static const PageRoute noticiasDetails =
      PageRoute(name: "noticiasDetails", path: "details");

  static const PageRoute musicDetails =
      PageRoute(name: "musicDetails", path: "details");
  static const PageRoute videosDetails =
      PageRoute(name: "videosDetails", path: "details");
  static const PageRoute favoritosDetails =
      PageRoute(name: "favoritosDetails", path: "details");
  static const PageRoute agendaFiltersCategory =
      PageRoute(name: "categoryAgenda", path: "categoryAgenda");
  static const PageRoute noticiasCategorias =
      PageRoute(name: "noticiasCategorias", path: "categoryNoticias");
  static const PageRoute categoryMusic =
      PageRoute(name: "categoryMusic", path: "categoryMusic");
  static const PageRoute categoryVideo =
      PageRoute(name: "categoryVideo", path: "categoryVideo");
  static const PageRoute infoPage =
      PageRoute(name: "infoPage", path: "/infoPage");
  static const PageRoute chatPage = PageRoute(name: "chat", path: "chat");
}

class PageRoute {
  final String name;
  final String path;
  const PageRoute({
    required this.name,
    required this.path,
  });
}
