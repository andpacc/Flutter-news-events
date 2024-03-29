import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/video_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_video.dart';
import 'package:example/domain/entities/models/video.dart';
import 'package:example/domain/repositories/video_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VideoRepository)
class VideoRepositoryImpl implements VideoRepository {
  final VideoDataSource videoDataSource;

  VideoRepositoryImpl(this.videoDataSource);

  @override
  Future<Either<Failure, List<Video>>> getVideos() async {
    try {
      final videoDataSourceResult = await videoDataSource.getVideos();
      return videoDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }

  Future<Either<Failure, List<CategoryVideo>>> getCategoryVideos() async {
    try {
      final videoDataSourceResult = await videoDataSource.getCategoryVideos();
      return videoDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
