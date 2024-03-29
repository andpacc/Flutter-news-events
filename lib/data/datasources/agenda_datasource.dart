// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/categories_agenda.dart';
import 'package:example/domain/entities/models/sugerencias_eventos.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AgendaDataSource {
  Future<Either<Failure, List<Agenda>>> getAgenda();
  Future<Either<Failure, List<CategoriesAgenda>>> getAgendaCategories();
  Future<Either<Failure, bool>> addSugerenciasEventos(Sugerencias sugerencias);
}

@LazySingleton(as: AgendaDataSource)
class AgendaDataSourceImpl implements AgendaDataSource {
  final SupabaseClient supabase;

  AgendaDataSourceImpl(this.supabase);

  @override
  Future<Either<Failure, List<Agenda>>> getAgenda() async {
    final response = await supabase
        .from("Evento")
        .select("*")
        .gt("fechahora", DateTime.now());
    final data = response;
    final agenda = data.map((e) => Agenda.fromMap(e)).toList();
    return right(agenda);
  }

  @override
  Future<Either<Failure, List<CategoriesAgenda>>> getAgendaCategories() async {
    final response = await supabase.from("EventoCategorias").select("*");
    final data = response;
    final List<CategoriesAgenda> categoriesAgenda =
        data.map((e) => CategoriesAgenda.fromMap(e)).toList();
    return right(categoriesAgenda);
  }

  @override
  Future<Either<Failure, bool>> addSugerenciasEventos(
      Sugerencias sugerencias) async {
    final response =
        await supabase.from("Sugerencia").insert(sugerencias.toMap());

    if (response == null) return left(NoDataFailure());
    return right(true);
  }
}
