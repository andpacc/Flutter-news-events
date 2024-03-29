import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/models/categories_agenda.dart';
import 'package:example/domain/entities/models/sugerencias_eventos.dart';

import '../entities/errors/failures.dart';
import '../entities/models/agenda.dart';

abstract class AgendaRepository {
  Future<Either<Failure, List<Agenda>>> getAgenda();
  Future<Either<Failure, List<CategoriesAgenda>>> getAgendaCategories();
  Future<Either<Failure, bool>> addSugerenciasEventos(Sugerencias sugerencias);
}
