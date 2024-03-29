import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/news_fav_repository.dart';

//Esta clase es similar a la de agenda repositoryImpl pero hay algunas modificaciones
//hechas de manera diferente en el codigo para practicar.
@LazySingleton(as: NewsFavsRepository)
class NewsFavsRepositoryImpl implements NewsFavsRepository {
  Future<Box<Titular>> get _titularBox async =>
      await Hive.openBox("titularBox");

//Guardar titular
  @override
  Future<Either<Failure, bool>> addTitularFav(Titular titular) async {
    try {
      final box = await _titularBox;
      if (!box.containsKey(titular.id)) {
        await box.put(titular.id, titular);
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> clearAllFavs() async {
    final box = await _titularBox;
    final count = await box.clear();
    return right(count > 0);
  }

  @override
  Future<Either<Failure, bool>> clearTitularFav(Titular titular) async {
    final box = await _titularBox;
    if (box.containsKey(titular.id)) {
      box.delete(titular.id);
      return right(true);
    }
    return right(false);
  }

  @override
  Future<Either<Failure, List<Titular>>> getTitularesFav() async {
    try {
      final List<Titular> listaTitulares = (await _titularBox).values.toList();
      return right(listaTitulares);
    } catch (e) {
      return left(NoDataFailure());
    }
  }
}
