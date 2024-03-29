import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/repositories/agenda_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/agenda.dart';
import '../entities/usecase/usecase.dart';

@lazySingleton
class GetAgendaNewsUseCase
    extends UseCase<List<Agenda>, GetAgendaNewsUseCaseParams> {
  final AgendaRepository _agendaRepository;

  GetAgendaNewsUseCase(this._agendaRepository);

  @override
  Future<Either<Failure, List<Agenda>>> call(params) async {
    return await _agendaRepository.getAgenda();
  }
}

class GetAgendaNewsUseCaseParams {}
