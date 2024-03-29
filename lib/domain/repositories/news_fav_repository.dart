import 'package:dartz/dartz.dart';

import '../entities/errors/failures.dart';
import '../entities/models/titular.dart';

abstract class NewsFavsRepository {
  Future<Either<Failure, List<Titular>>> getTitularesFav();
  Future<Either<Failure, bool>> addTitularFav(Titular titular);
  Future<Either<Failure, bool>> clearTitularFav(Titular titular);
  Future<Either<Failure, bool>> clearAllFavs();
}
