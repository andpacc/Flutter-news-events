// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'noticias_bloc.dart';

@immutable
abstract class NoticiasEvent {}

class InitializeNoticiasEvent extends NoticiasEvent {}

class AddFavNoticiaEvent extends NoticiasEvent {
  final Titular titular;
  AddFavNoticiaEvent({
    required this.titular,
  });
}

class ClearFavNoticiasEvent extends NoticiasEvent {
  final Titular titular;

  ClearFavNoticiasEvent(this.titular);
}

class ClearAllFavsNoticiasEvent extends NoticiasEvent {}

class GetNoticiasFavEvent extends NoticiasEvent {}

class CategoryNewsSelectionEvent extends NoticiasEvent {
  final int categoryId;
  final bool isSelected;

  CategoryNewsSelectionEvent(this.categoryId, this.isSelected);
}

class ResetNewsCategoryEvent extends NoticiasEvent {}
