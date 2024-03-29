// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'noticias_bloc.dart';

class NoticiaStateData {
  final List<Titular> titulares;
  final List<Titular> titularesFav;
  final List<int> selectedCategoriaTitulares;
  final List<CategoryTitulares> categoriaTitulares;
  final List<Titular> noticiasFiltradas;

  const NoticiaStateData(
      {this.titulares = const [],
      this.titularesFav = const [],
      this.selectedCategoriaTitulares = const [],
      this.categoriaTitulares = const [],
      this.noticiasFiltradas = const []});

  NoticiaStateData copyWith(
      {List<Titular>? titulares,
      List<Titular>? titularesFav,
      List<int>? selectedCategoriaTitulares,
      List<CategoryTitulares>? categoriaTitulares,
      List<Titular>? noticiasFiltradas}) {
    return NoticiaStateData(
        titulares: titulares ?? this.titulares,
        titularesFav: titularesFav ?? this.titularesFav,
        selectedCategoriaTitulares:
            selectedCategoriaTitulares ?? this.selectedCategoriaTitulares,
        categoriaTitulares: categoriaTitulares ?? this.categoriaTitulares,
        noticiasFiltradas: noticiasFiltradas ?? this.noticiasFiltradas);
  }
}

@immutable
abstract class NoticiaState {
  final NoticiaStateData stateData;
  const NoticiaState({
    required this.stateData,
  });
}

class NoticiaInitialState extends NoticiaState {
  const NoticiaInitialState({super.stateData = const NoticiaStateData()});
}

class NoticiaLoadedState extends NoticiaState {
  const NoticiaLoadedState({required super.stateData});
}

class NoticiaErrorState extends NoticiaState {
  final String message;
  const NoticiaErrorState({required super.stateData, required this.message});
}
