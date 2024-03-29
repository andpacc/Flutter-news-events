import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_titulares.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNewsCategoryUseCase
    extends UseCase<List<CategoryTitulares>, GetNewsCategoryUseCaseParams> {
  final NewsRepository _newsCategoriesRepository;

  GetNewsCategoryUseCase(this._newsCategoriesRepository);
  @override
  Future<Either<Failure, List<CategoryTitulares>>> call(params) async {
    return await _newsCategoriesRepository.getNewsCategories();
  }
}

class GetNewsCategoryUseCaseParams {}
