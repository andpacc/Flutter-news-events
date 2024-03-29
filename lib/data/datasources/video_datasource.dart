import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_video.dart';
import 'package:example/domain/entities/models/video.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class VideoDataSource {
  Future<Either<Failure, List<Video>>> getVideos();
  Future<Either<Failure, List<CategoryVideo>>> getCategoryVideos();
}

@LazySingleton(as: VideoDataSource)
class VideoDataSourceImpl implements VideoDataSource {
  final SupabaseClient supabase;

  VideoDataSourceImpl(this.supabase);

  @override
  Future<Either<Failure, List<Video>>> getVideos() async {
    final response = await supabase.from("Video").select("*");

    final data = response;
    final List<Video> videoList = data.map((e) => Video.fromMap(e)).toList();
    return right(videoList);
  }

  @override
  Future<Either<Failure, List<CategoryVideo>>> getCategoryVideos() async {
    final response = await supabase.from("VideosCategorias").select("*");
    final data = response;
    final List<CategoryVideo> listCategoryMusic =
        data.map((e) => CategoryVideo.fromMap(e)).toList();
    return right(listCategoryMusic);
  }
}
