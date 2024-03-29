import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/models/categories_music.dart';

import '../entities/errors/failures.dart';
import '../entities/models/music.dart';

abstract class MusicRepository {
  Future<Either<Failure, List<Music>>> getMusic();
  Future<Either<Failure, List<CategoryMusic>>> getCategories();
}
