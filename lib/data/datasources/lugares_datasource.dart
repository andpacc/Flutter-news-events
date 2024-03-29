import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LugaresDataSource {
  Future<Either<Failure, List<LugarEventos>>> getLugaresEventos();
}

@LazySingleton(as: LugaresDataSource)
class LugaresDataSourceImpl extends LugaresDataSource {
  final SupabaseClient supabase;

  LugaresDataSourceImpl(this.supabase);
  @override
  Future<Either<Failure, List<LugarEventos>>> getLugaresEventos() async {
    final response = await supabase.from("Lugar").select("*");
    final data = response;
    final List<LugarEventos> listLugares =
        data.map((e) => LugarEventos.fromMap(e)).toList();
    return right(listLugares);
  }
}
