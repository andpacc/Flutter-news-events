import 'package:example/domain/entities/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/lugar_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLugaresUseCase
    extends UseCase<List<LugarEventos>, GetLugaresUseCaseParams> {
  final LugaresEventosRepository _lugaresEventosRepository;

  GetLugaresUseCase(this._lugaresEventosRepository);
  @override
  Future<Either<Failure, List<LugarEventos>>> call(params) async {
    return await _lugaresEventosRepository.getLugaresEventos();
  }
}

class GetLugaresUseCaseParams {}
