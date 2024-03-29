import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/music_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_music.dart';
import 'package:example/domain/entities/models/music.dart';
import 'package:example/domain/repositories/music_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MusicRepository)
class MusicRepositoryImpl implements MusicRepository {
  final MusicDatasource musicDatasource;

  MusicRepositoryImpl(this.musicDatasource);

  @override
  Future<Either<Failure, List<Music>>> getMusic() async {
    try {
      final musicDataSourceResult = await musicDatasource.getMusic();
      return musicDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }

  Future<Either<Failure, List<CategoryMusic>>> getCategories() async {
    try {
      final musicDataSourceResult = await musicDatasource.getCategories();
      return musicDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
