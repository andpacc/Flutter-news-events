import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/models/categories_video.dart';

import '../entities/errors/failures.dart';
import '../entities/models/video.dart';

abstract class VideoRepository {
  Future<Either<Failure, List<Video>>> getVideos();
  Future<Either<Failure, List<CategoryVideo>>> getCategoryVideos();
}
