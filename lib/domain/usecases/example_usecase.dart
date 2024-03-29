// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:example/domain/entities/usecase/usecase.dart';

import '../entities/models/titular.dart';

@lazySingleton
class ExampleUseCase extends UseCase<List<Titular>, ExampleUseCaseParams> {
  final NewsRepository newsRepository;

  ExampleUseCase(this.newsRepository);

  @override
  call(ExampleUseCaseParams params) async {
    final newsRes = await newsRepository.getTitulares();

    return newsRes;
  }
}

class ExampleUseCaseParams {
  final String saludo;
  ExampleUseCaseParams({
    required this.saludo,
  });
}


//LLAMADA A REPOSITORIOS 