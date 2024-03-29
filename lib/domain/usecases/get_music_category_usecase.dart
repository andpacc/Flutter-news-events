import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_music.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/music_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMusicCategoryUseCase
    extends UseCase<List<CategoryMusic>, GetMusicCategoryUseCaseParams> {
  final MusicRepository _musicCategoryRepository;

  GetMusicCategoryUseCase(this._musicCategoryRepository);
  @override
  Future<Either<Failure, List<CategoryMusic>>> call(params) async {
    return await _musicCategoryRepository.getCategories();
  }
}

class GetMusicCategoryUseCaseParams {}
