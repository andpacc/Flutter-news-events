import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/categories_agenda.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/agenda_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAgendaCategoriesUseCase
    extends UseCase<List<CategoriesAgenda>, GetAgendaCategoriesUseCaseParams> {
  final AgendaRepository _agendaCategoriesRepository;

  GetAgendaCategoriesUseCase(this._agendaCategoriesRepository);
  @override
  Future<Either<Failure, List<CategoriesAgenda>>> call(params) async {
    return await _agendaCategoriesRepository.getAgendaCategories();
  }
}

class GetAgendaCategoriesUseCaseParams {}
