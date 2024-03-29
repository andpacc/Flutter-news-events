import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/agenda_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/sugerencias_eventos.dart';

@lazySingleton
class AddAgendaSugerenciasUsecase
    extends UseCase<void, AddAgendaSugerenciasUseCaseParams> {
  final AgendaRepository _sugerenciasEventosRepository;

  AddAgendaSugerenciasUsecase(this._sugerenciasEventosRepository);
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _sugerenciasEventosRepository
        .addSugerenciasEventos(params.sugerencias);
  }
}

class AddAgendaSugerenciasUseCaseParams {
  final Sugerencias sugerencias;

  AddAgendaSugerenciasUseCaseParams({required this.sugerencias});
}
