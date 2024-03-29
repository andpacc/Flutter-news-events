import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/news_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_titulares.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsDatasource newsDataSource;
  NewsRepositoryImpl(this.newsDataSource);

  @override
  Future<Either<Failure, List<Titular>>> getTitulares() async {
    try {
      final newsDataSourceResp = newsDataSource.getTitulares();
      return newsDataSourceResp;
    } catch (e) {
      return left(OperationFailure());
    }
  }

  Future<Either<Failure, List<CategoryTitulares>>> getNewsCategories() async {
    try {
      final newsDataSourceResult = await newsDataSource.getNewsCategories();
      return newsDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
