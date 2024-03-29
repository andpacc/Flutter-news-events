import 'package:example/domain/entities/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/localidades_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/localidades.dart';

@lazySingleton
class GetLocalidadesUseCase
    extends UseCase<List<Localidad>, GetLocalidadesUseCaseParams> {
  final LocalidadesRepository _localidadesRepository;

  GetLocalidadesUseCase(this._localidadesRepository);
  @override
  Future<Either<Failure, List<Localidad>>> call(params) async {
    return await _localidadesRepository.getLocalidades();
  }
}

class GetLocalidadesUseCaseParams {}
