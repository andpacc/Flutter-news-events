import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/sugerencias_eventos.dart';
import 'package:example/domain/usecases/get_agenda.dart';
import 'package:example/domain/usecases/get_agenda_categories_usecase.dart';
import 'package:example/domain/usecases/get_agenda_favs.dart';
import 'package:example/domain/usecases/get_agenda_sugerencias_usecase.dart';
import 'package:example/domain/usecases/get_localidades_usecase.dart';
import 'package:example/domain/usecases/get_lugares_usecase.dart';
import 'package:mocktail/mocktail.dart';

//class MockGetCasesUseCase extends Mock implements GetCasesUsecase {}

class MockGetAgendaNewsUseCase extends Mock implements GetAgendaNewsUseCase {}

class MockGetLocalidadesUseCase extends Mock implements GetLocalidadesUseCase {}

class MockGetAgendaCategoriesUseCase extends Mock
    implements GetAgendaCategoriesUseCase {}

class MockAddAgendaSugerenciasUsecase extends Mock
    implements AddAgendaSugerenciasUsecase {}

class MockGetLugaresUseCase extends Mock implements GetLugaresUseCase {}

class MockGetAgendaFavsNewsUseCase extends Mock
    implements GetAgendaFavsNewsUseCase {}

class MockAddAgendaFavsNewsUseCase extends Mock
    implements AddAgendaFavsNewsUseCase {}

class MockClearAgendaFavsNewsUseCase extends Mock
    implements ClearAgendaFavsNewsUseCase {}

class MockClearAllFavsNewsUseCase extends Mock
    implements ClearAllFavsNewsUseCase {}

class MockAgenda extends Mock implements Agenda {}

class MockFailure extends Mock implements Failure {}

class MockSugerencias extends Mock implements Sugerencias {}
