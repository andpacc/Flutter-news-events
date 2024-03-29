import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/repositories/agenda_fav_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AgendaFavRepository)
class AgendaFavRepositoryImpl implements AgendaFavRepository {
  Future<Box<Agenda>> get _agendaBox async => await Hive.openBox("agendaBox");

//Añadir a favs
  @override
  Future<Either<Failure, bool>> addAgendaFav(Agenda agenda) async {
    try {
      final box = await _agendaBox;
      if (!box.keys.contains(agenda.id)) {
        await box.put(agenda.id, agenda);
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(NoDataFailure());
    }
  }

//Limpiar el favorito
  @override
  Future<Either<Failure, bool>> clearAgendaFav(Agenda agenda) async {
    final box = await _agendaBox;

    if (box.keys.contains(agenda.id)) {
      box.delete(agenda.id);
      return right(true);
    }
    return right(false);
  }

//Limpiar todos
  @override
  Future<Either<Failure, bool>> clearAllFavs() async {
    final box = await _agendaBox;
    final count = await box.clear();
    return right(count > 0);
  }

//obtener lista favs
  @override
  Future<Either<Failure, List<Agenda>>> getAgendaFav() async {
    try {
      final List<Agenda> agendaFavs = (await _agendaBox).values.toList();
      return right(agendaFavs);
    } catch (e) {
      return left(NoDataFailure());
    }
  }
}
