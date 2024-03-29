import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/categories_agenda.dart';
import 'package:example/domain/entities/models/localidades.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/domain/usecases/get_agenda.dart';
import 'package:example/domain/usecases/get_agenda_categories_usecase.dart';
import 'package:example/domain/usecases/get_agenda_favs.dart';
import 'package:example/domain/usecases/get_agenda_sugerencias_usecase.dart';
import 'package:example/domain/usecases/get_localidades_usecase.dart';
import 'package:example/domain/usecases/get_lugares_usecase.dart';
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'agenda_bloc_mock.dart';

void main() {
  late MockGetAgendaNewsUseCase mockGetAgendaNewsUseCase;
  late MockGetLocalidadesUseCase mockGetLocalidadesUseCase;
  late MockGetAgendaCategoriesUseCase mockGetAgendaCategoriesUseCase;
  late MockAddAgendaSugerenciasUsecase mockAddAgendaSugerenciasUsecase;
  late MockGetLugaresUseCase mockGetLugaresUseCase;
  late MockGetAgendaFavsNewsUseCase mockGetAgendaFavsNewsUseCase;
  late MockAddAgendaFavsNewsUseCase mockAddAgendaFavsNewsUseCase;
  late MockClearAgendaFavsNewsUseCase mockClearAgendaFavsNewsUseCase;
  late MockClearAllFavsNewsUseCase mockClearAllFavsNewsUseCase;
  late MockSugerencias mockSugerencias;
  late MockFailure mockFailure;
  late AgendaBloc miAgendaBloc;
  late MockAgenda mockAgenda;
  setUp(() {
    mockAgenda = MockAgenda();
    mockSugerencias = MockSugerencias();
    registerFallbackValue(AddAgendaFavsNewsUseCaseParams(agenda: mockAgenda));
    registerFallbackValue(ClearAgendaFavsNewsUseCaseParams(agenda: mockAgenda));
    registerFallbackValue(GetAgendaNewsUseCaseParams());
    registerFallbackValue(ClearAllFavsAgendaNewsUseCaseParams());
    registerFallbackValue(GetLocalidadesUseCaseParams());
    registerFallbackValue(GetAgendaCategoriesUseCaseParams());
    registerFallbackValue(GetLugaresUseCaseParams());
    registerFallbackValue(GetAgendaFavsNewsUseCaseParams());
    registerFallbackValue(
        AddAgendaSugerenciasUseCaseParams(sugerencias: mockSugerencias));
    mockGetAgendaNewsUseCase = MockGetAgendaNewsUseCase();
    mockGetLocalidadesUseCase = MockGetLocalidadesUseCase();
    mockGetAgendaCategoriesUseCase = MockGetAgendaCategoriesUseCase();
    mockAddAgendaSugerenciasUsecase = MockAddAgendaSugerenciasUsecase();
    mockGetLugaresUseCase = MockGetLugaresUseCase();
    mockGetAgendaFavsNewsUseCase = MockGetAgendaFavsNewsUseCase();
    mockAddAgendaFavsNewsUseCase = MockAddAgendaFavsNewsUseCase();
    mockClearAgendaFavsNewsUseCase = MockClearAgendaFavsNewsUseCase();

    mockClearAllFavsNewsUseCase = MockClearAllFavsNewsUseCase();

    mockFailure = MockFailure();
    miAgendaBloc = AgendaBloc(
        mockGetAgendaNewsUseCase,
        mockGetAgendaFavsNewsUseCase,
        mockAddAgendaFavsNewsUseCase,
        mockClearAgendaFavsNewsUseCase,
        mockClearAllFavsNewsUseCase,
        mockGetLocalidadesUseCase,
        mockGetAgendaCategoriesUseCase,
        mockAddAgendaSugerenciasUsecase,
        mockGetLugaresUseCase);
  });
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when AddAgendaFavEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(AddAgendaFavEvent(agenda: mockAgenda)),
    setUp: () => when(() => mockAddAgendaFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaErrorState] when AddAgendaFavEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(AddAgendaFavEvent(agenda: mockAgenda)),
    setUp: () => when(() => mockAddAgendaFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<AgendaErrorState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when ClearAgenda is called and is succesfully",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(ClearAgendaFavEvent(agenda: mockAgenda)),
    setUp: () => when(() => mockClearAgendaFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaErrorState] when Clear is called and failed",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(ClearAgendaFavEvent(agenda: mockAgenda)),
    setUp: () => when(() => mockClearAgendaFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<AgendaErrorState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when ClearAllFavsEvent is called and is succesfully",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(ClearAllFavsEvent()),
    setUp: () => when(() => mockClearAllFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaErrorState] when ClearAllFavsEvent is called and failed",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(ClearAllFavsEvent()),
    setUp: () => when(() => mockClearAllFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<AgendaErrorState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when GetAgendaFavEvent is called and is succesfully",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(GetAgendaFavEvent()),
    setUp: () => when(() => mockGetAgendaFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(<Agenda>[])),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaErrorState] when GetAgendaFavEvent is called and failed",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(GetAgendaFavEvent()),
    setUp: () => when(() => mockGetAgendaFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<AgendaErrorState>()],
  );

  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when InitializedAgendaEvent is called",
    build: () => miAgendaBloc,
    act: (bloc) => bloc.add(InitializedAgendaEvent()),
    seed: () => const AgendaInitialState(),
    setUp: () {
      when(() => mockGetAgendaNewsUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<Agenda>[]));
      when(() => mockGetAgendaFavsNewsUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<Agenda>[]));
      when(() => mockGetLocalidadesUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<Localidad>[]));
      when(() => mockGetAgendaCategoriesUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<CategoriesAgenda>[]));
      when(() => mockGetLugaresUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<LugarEventos>[]));
    },
    expect: () => [
      isA<AgendaLoadedState>(),
    ],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaErrorState] when InitializedAgendaEvent is called and Failed",
    build: () => miAgendaBloc,
    act: (bloc) => bloc.add(InitializedAgendaEvent()),
    seed: () => const AgendaInitialState(),
    setUp: () {
      when(() => mockGetAgendaNewsUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      when(() => mockGetAgendaFavsNewsUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      when(() => mockGetLocalidadesUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      when(() => mockGetAgendaCategoriesUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      when(() => mockGetLugaresUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
    },
    expect: () => [
      isA<AgendaErrorState>(),
    ],
  );

  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when ChangeSelectedLocalidadEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(ChangeSelectedLocalidadEvent("idLocalidad", 2)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when CategoryAgendaSelectionEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(CategoryAgendaSelectionEvent(1, true)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when SwitchEntradaLibreEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(SwitchEntradaLibreEvent()),
    expect: () => [isA<AgendaLoadedState>()],
  );

  blocTest<AgendaBloc, AgendaState>(
    "Reinicia las fechas cuando la fecha inicial seleccionada es posterior a la fecha final existente",
    build: () => miAgendaBloc,
    seed: () => AgendaLoadedState(
      agendaStateData: AgendaStateData(
        fechaInicial: DateTime(2020, 1, 10),
        fechaFinal: DateTime(2020, 1, 12),
      ),
    ),
    act: (bloc) => bloc.add(SelectAgendaDateEvent(DateTime(2020, 1, 13), true)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when ResetCalendarEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(
      ResetCalendarEvent(),
    ),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when ResetFiltersEvent is called",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(
      ResetFiltersEvent(),
    ),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when SubmitAgendaEvent is called and succesfully",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(
      SubmitAgendaEvent(mockSugerencias),
    ),
    setUp: () => when(() => mockAddAgendaSugerenciasUsecase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<AgendaLoadedState>()],
  );
  blocTest<AgendaBloc, AgendaState>(
    "Emit[AgendaLoadedState] when SubmitAgendaEvent is called and failed",
    build: () => miAgendaBloc,
    seed: () => const AgendaInitialState(),
    act: (bloc) => bloc.add(
      SubmitAgendaEvent(mockSugerencias),
    ),
    setUp: () => when(() => mockAddAgendaSugerenciasUsecase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<AgendaErrorState>()],
  );
}
