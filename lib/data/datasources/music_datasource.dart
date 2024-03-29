import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_music.dart';
import 'package:example/domain/entities/models/music.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MusicDatasource {
  Future<Either<Failure, List<Music>>> getMusic();
  Future<Either<Failure, List<CategoryMusic>>> getCategories();
}

@LazySingleton(as: MusicDatasource)
class MusicDatasourceImpl implements MusicDatasource {
  final SupabaseClient supabase;

  MusicDatasourceImpl(this.supabase);

  @override
  Future<Either<Failure, List<Music>>> getMusic() async {
    final response = await supabase.from("Music").select("*");
    final data = response;
    final List<Music> listMusic = data.map((e) => Music.fromMap(e)).toList();
    return right(listMusic);
  }

  @override
  Future<Either<Failure, List<CategoryMusic>>> getCategories() async {
    final response = await supabase.from("MusicCategorias").select("*");
    final data = response;
    final List<CategoryMusic> listCategoryMusic =
        data.map((e) => CategoryMusic.fromMap(e)).toList();
    return right(listCategoryMusic);
  }
}
