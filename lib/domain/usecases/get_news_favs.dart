// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/news_fav_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/titular.dart';

//Obtener Noticias favs caso de uso
@lazySingleton
class GetFavsNewsUseCase
    extends UseCase<List<Titular>, GetFavsNewsUseCaseParams> {
  final NewsFavsRepository _newsFavsRepository;

  GetFavsNewsUseCase(this._newsFavsRepository);

  @override
  Future<Either<Failure, List<Titular>>> call(params) async {
    return await _newsFavsRepository.getTitularesFav();
  }
}

class GetFavsNewsUseCaseParams {}

// añadir Noticia a fav caso de uso
@lazySingleton
class AddFavsNewsUseCase extends UseCase<void, AddFavsNewsUseCaseParams> {
  final NewsFavsRepository _newsFavsRepository;

  AddFavsNewsUseCase(this._newsFavsRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _newsFavsRepository.addTitularFav(params.titular);
  }
}

class AddFavsNewsUseCaseParams {
  Titular titular;
  AddFavsNewsUseCaseParams({
    required this.titular,
  });
}

//Borrar Noticia de fav caso de uso
@lazySingleton
class ClearFavsNewsUseCase extends UseCase<void, ClearFavsNewsUseCaseParams> {
  final NewsFavsRepository _newsFavsRepository;

  ClearFavsNewsUseCase(this._newsFavsRepository);

  @override
  Future<Either<Failure, bool>> call(ClearFavsNewsUseCaseParams params) async {
    return await _newsFavsRepository.clearTitularFav(params.titular);
  }
}

class ClearFavsNewsUseCaseParams {
  Titular titular;
  ClearFavsNewsUseCaseParams({
    required this.titular,
  });
}

//Borrar todas las Noticias de fav caso de uso
@lazySingleton
class ClearAllFavsNewsUseCase
    extends UseCase<void, ClearAllNewsFavsNewsUseCaseParams> {
  final NewsFavsRepository _newsFavsRepository;

  ClearAllFavsNewsUseCase(this._newsFavsRepository);
  @override
  Future<Either<Failure, bool>> call(
      ClearAllNewsFavsNewsUseCaseParams params) async {
    return await _newsFavsRepository.clearAllFavs();
  }
}

class ClearAllNewsFavsNewsUseCaseParams {}
