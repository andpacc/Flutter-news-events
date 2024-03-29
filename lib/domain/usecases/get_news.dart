import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNewsUseCase extends UseCase<List<Titular>, GetNewsUseCaseParams> {
  final NewsRepository _newsRepository;

  GetNewsUseCase(this._newsRepository);

  @override
  Future<Either<Failure, List<Titular>>> call(params) async {
    return await _newsRepository.getTitulares();
  }
}

class GetNewsUseCaseParams {}
