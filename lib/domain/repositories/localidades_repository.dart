import 'package:dartz/dartz.dart';

import '../entities/errors/failures.dart';
import '../entities/models/localidades.dart';

abstract class LocalidadesRepository {
  Future<Either<Failure, List<Localidad>>> getLocalidades();
}
