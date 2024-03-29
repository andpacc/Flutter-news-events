import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/lugar.dart';

abstract class LugaresEventosRepository {
  Future<Either<Failure, List<LugarEventos>>> getLugaresEventos();
}
