// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/agenda_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/categories_agenda.dart';
import 'package:example/domain/entities/models/sugerencias_eventos.dart';
import 'package:example/domain/repositories/agenda_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AgendaRepository)
class AgendaRepositoryImpl implements AgendaRepository {
  final AgendaDataSource agendaDataSource;

  AgendaRepositoryImpl(this.agendaDataSource);

  @override
  Future<Either<Failure, List<Agenda>>> getAgenda() async {
    try {
      final agendaDataSourceResult = await agendaDataSource.getAgenda();
      return agendaDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoriesAgenda>>> getAgendaCategories() async {
    try {
      final agendaDataSourceResult =
          await agendaDataSource.getAgendaCategories();
      return agendaDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addSugerenciasEventos(
      Sugerencias sugerencias) async {
    try {
      final agendaDataSourceResult =
          await agendaDataSource.addSugerenciasEventos(sugerencias);
      return agendaDataSourceResult;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
