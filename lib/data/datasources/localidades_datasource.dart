import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/localidades.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LocalidadesDataSource {
  Future<Either<Failure, List<Localidad>>> getLocalidades();
}

@LazySingleton(as: LocalidadesDataSource)
class LocalidadesDataSourceImpl extends LocalidadesDataSource {
  final SupabaseClient supabase;

  LocalidadesDataSourceImpl(this.supabase);

  @override
  Future<Either<Failure, List<Localidad>>> getLocalidades() async {
    final response = await supabase.from("Localidad").select("*");
    final data = response;
    final List<Localidad> listLocalidades =
        data.map((e) => Localidad.fromMap(e)).toList();
    return right(listLocalidades);
  }
}
