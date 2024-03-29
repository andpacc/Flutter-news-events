import 'package:example/domain/entities/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/music_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/music.dart';

@lazySingleton
class GetMusicUseCase extends UseCase<List<Music>, GetMusicUseCaseParams> {
  final MusicRepository _musicRepository;

  GetMusicUseCase(this._musicRepository);
  @override
  Future<Either<Failure, List<Music>>> call(params) async {
    return await _musicRepository.getMusic();
  }
}

class GetMusicUseCaseParams {}
