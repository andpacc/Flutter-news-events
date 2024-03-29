// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/agenda_fav_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/models/agenda.dart';

@lazySingleton
class GetAgendaFavsNewsUseCase
    extends UseCase<List<Agenda>, GetAgendaFavsNewsUseCaseParams> {
  final AgendaFavRepository _agendaFavRepository;

  GetAgendaFavsNewsUseCase(this._agendaFavRepository);

  @override
  Future<Either<Failure, List<Agenda>>> call(params) async {
    return await _agendaFavRepository.getAgendaFav();
  }
}

class GetAgendaFavsNewsUseCaseParams {}

//añadir a favoritos
@lazySingleton
class AddAgendaFavsNewsUseCase
    extends UseCase<void, AddAgendaFavsNewsUseCaseParams> {
  final AgendaFavRepository _agendaFavRepository;

  AddAgendaFavsNewsUseCase(this._agendaFavRepository);
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _agendaFavRepository.addAgendaFav(params.agenda);
  }
}

class AddAgendaFavsNewsUseCaseParams {
  Agenda agenda;
  AddAgendaFavsNewsUseCaseParams({
    required this.agenda,
  });
}

//limpiar el parametro
@lazySingleton
class ClearAgendaFavsNewsUseCase
    extends UseCase<void, ClearAgendaFavsNewsUseCaseParams> {
  final AgendaFavRepository _agendaFavRepository;

  ClearAgendaFavsNewsUseCase(this._agendaFavRepository);
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _agendaFavRepository.clearAgendaFav(params.agenda);
  }
}

class ClearAgendaFavsNewsUseCaseParams {
  Agenda agenda;
  ClearAgendaFavsNewsUseCaseParams({
    required this.agenda,
  });
}

//limpiar todos los favs que guardo.
@lazySingleton
class ClearAllFavsNewsUseCase
    extends UseCase<void, ClearAllFavsAgendaNewsUseCaseParams> {
  final AgendaFavRepository _agendaFavRepository;

  ClearAllFavsNewsUseCase(this._agendaFavRepository);
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _agendaFavRepository.clearAllFavs();
  }
}

class ClearAllFavsAgendaNewsUseCaseParams {}
