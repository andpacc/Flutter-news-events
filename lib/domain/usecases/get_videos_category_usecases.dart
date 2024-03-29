import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/video_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/categories_video.dart';

@lazySingleton
class GetVideosCategoryUseCase
    extends UseCase<List<CategoryVideo>, GetVideosCategoryUseCaseParams> {
  final VideoRepository _videoCategoriesRepository;

  GetVideosCategoryUseCase(this._videoCategoriesRepository);
  @override
  Future<Either<Failure, List<CategoryVideo>>> call(params) async {
    return await _videoCategoriesRepository.getCategoryVideos();
  }
}

class GetVideosCategoryUseCaseParams {}
