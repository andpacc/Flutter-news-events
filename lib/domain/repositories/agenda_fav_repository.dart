import 'package:dartz/dartz.dart';

import '../entities/errors/failures.dart';
import '../entities/models/agenda.dart';

abstract class AgendaFavRepository {
  Future<Either<Failure, List<Agenda>>> getAgendaFav();
  Future<Either<Failure, bool>> addAgendaFav(Agenda agenda);
  Future<Either<Failure, bool>> clearAgendaFav(Agenda agenda);
  Future<Either<Failure, bool>> clearAllFavs();
}
