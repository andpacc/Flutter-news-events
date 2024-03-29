import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/localidades_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/localidades.dart';
import 'package:example/domain/repositories/localidades_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalidadesRepository)
class LocalidadesRepositoryImpl extends LocalidadesRepository {
  final LocalidadesDataSource localidadesDataSource;

  LocalidadesRepositoryImpl(this.localidadesDataSource);

  @override
  Future<Either<Failure, List<Localidad>>> getLocalidades() async {
    try {
      final localidadesDataSourceResult =
          await localidadesDataSource.getLocalidades();
      return localidadesDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
