import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/lugares_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/domain/repositories/lugar_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LugaresEventosRepository)
class LugaresEventosRepositoryImplementation extends LugaresEventosRepository {
  final LugaresDataSource lugaresDataSource;

  LugaresEventosRepositoryImplementation(this.lugaresDataSource);
  @override
  Future<Either<Failure, List<LugarEventos>>> getLugaresEventos() async {
    try {
      final lugaresDataSourceResult =
          await lugaresDataSource.getLugaresEventos();
      return lugaresDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
