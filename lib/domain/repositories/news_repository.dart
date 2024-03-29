import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_titulares.dart';

import '../entities/models/titular.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Titular>>> getTitulares();
  Future<Either<Failure, List<CategoryTitulares>>> getNewsCategories();
}
