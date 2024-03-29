import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:example/constants/environment.dart' as miEnv;
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_titulares.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NewsDatasource {
  Future<Either<Failure, List<Titular>>> getTitulares();
  Future<Either<Failure, List<CategoryTitulares>>> getNewsCategories();
}

@LazySingleton(as: NewsDatasource)
class NewsDataSourceImpl implements NewsDatasource {
  final SupabaseClient supabase;

  NewsDataSourceImpl(this.supabase);

  @override
  Future<Either<Failure, List<Titular>>> getTitulares() async {
    final response = await supabase.from("Noticia").select("*");
    final data = response;
    final titulares = data.map((e) => Titular.fromMap(e)).toList();
    return right(titulares);
  }

  final String supabaseUrl =
      "https://ciacdrcmaihkpwfrhzxs.supabase.co/rest/v1/NoticiasCategorias";
  final String supabaseKey = miEnv.Environment.supabaseAnnonApi;

  @override
  Future<Either<Failure, List<CategoryTitulares>>> getNewsCategories() async {
    try {
      final response = await http.get(
        Uri.parse(supabaseUrl),
        headers: {
          "apikey": supabaseKey,
          "Authorization": "Bearer $supabaseKey",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<CategoryTitulares> newsCategories =
            data.map((e) => CategoryTitulares.fromMap(e)).toList();
        return right(newsCategories);
      } else {
        return left(NoDataFailure());
      }
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
