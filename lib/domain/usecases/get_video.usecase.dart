import 'package:example/domain/entities/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/video_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/video.dart';

@lazySingleton
class GetVideoUseCase extends UseCase<List<Video>, GetVideoUseCaseParams> {
  final VideoRepository _videoRepository;

  GetVideoUseCase(this._videoRepository);
  @override
  Future<Either<Failure, List<Video>>> call(params) async {
    return await _videoRepository.getVideos();
  }
}

class GetVideoUseCaseParams {}
