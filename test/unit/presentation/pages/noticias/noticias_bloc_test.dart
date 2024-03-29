import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/models/categories_titulares.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/domain/usecases/get_news.dart';
import 'package:example/domain/usecases/get_news_category_usecase.dart';
import 'package:example/domain/usecases/get_news_favs.dart';
import 'package:example/presentation/pages/noticias/bloc/noticias_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'noticias_bloc_mock.dart';

void main() {
  late MockNewsUseCase mockNewsUseCase;
  late MockAddFavsNewsUseCase mockAddFavsNewsUseCase;
  late MockClearAllFavsNewsUseCase mockClearAllFavsNewsUseCase;
  late MockClearFavsNewsUseCase mockClearFavsNewsUseCase;
  late MockGetFavsNewsUseCase mockGetFavsNewsUseCase;
  late MockGetNewsCategoryUseCase mockGetNewsCategoryUseCase;
  late MockFailure mockFailure;
  late MockTitular mockTitular;
  late NoticiaBloc noticiaBloc;
  setUp(() {
    mockFailure = MockFailure();
    mockTitular = MockTitular();
    registerFallbackValue(GetNewsUseCaseParams());
    registerFallbackValue(AddFavsNewsUseCaseParams(titular: mockTitular));
    registerFallbackValue(ClearAllNewsFavsNewsUseCaseParams());
    registerFallbackValue(ClearFavsNewsUseCaseParams(titular: mockTitular));
    registerFallbackValue(GetFavsNewsUseCaseParams());
    registerFallbackValue(GetNewsCategoryUseCaseParams());
    mockNewsUseCase = MockNewsUseCase();
    mockAddFavsNewsUseCase = MockAddFavsNewsUseCase();
    mockClearAllFavsNewsUseCase = MockClearAllFavsNewsUseCase();
    mockClearFavsNewsUseCase = MockClearFavsNewsUseCase();
    mockGetFavsNewsUseCase = MockGetFavsNewsUseCase();
    mockGetNewsCategoryUseCase = MockGetNewsCategoryUseCase();
    mockNewsUseCase = MockNewsUseCase();
    noticiaBloc = NoticiaBloc(
        mockNewsUseCase,
        mockAddFavsNewsUseCase,
        mockClearAllFavsNewsUseCase,
        mockClearFavsNewsUseCase,
        mockGetFavsNewsUseCase,
        mockGetNewsCategoryUseCase);
  });

  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when InitializeNoticiasEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(InitializeNoticiasEvent()),
    setUp: () {
      when(() => mockNewsUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<Titular>[]));
      when(() => mockGetFavsNewsUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<Titular>[]));
      when(() => mockGetNewsCategoryUseCase.call(any()))
          .thenAnswer((invocation) async => const Right(<CategoryTitulares>[]));
    },
    expect: () => [isA<NoticiaLoadedState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaErrorState] when InitializeNoticiasEvent is called and failed ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(InitializeNoticiasEvent()),
    setUp: () {
      when(() => mockNewsUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      when(() => mockGetFavsNewsUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      when(() => mockGetNewsCategoryUseCase.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
    },
    expect: () => [isA<NoticiaErrorState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when AddFavNoticiaEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(AddFavNoticiaEvent(titular: mockTitular)),
    setUp: () => when(() => mockAddFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<NoticiaLoadedState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when AddFavNoticiaEvent is called and failed ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(AddFavNoticiaEvent(titular: mockTitular)),
    setUp: () => when(() => mockAddFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<NoticiaErrorState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when ClearAllFavsNoticiasEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(ClearAllFavsNoticiasEvent()),
    setUp: () => when(() => mockClearAllFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<NoticiaLoadedState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when ClearAllFavsNoticiasEvent is called and failed ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(ClearAllFavsNoticiasEvent()),
    setUp: () => when(() => mockClearAllFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<NoticiaErrorState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when ClearFavNoticiasEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(ClearFavNoticiasEvent(mockTitular)),
    setUp: () => when(() => mockClearFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(true)),
    expect: () => [isA<NoticiaLoadedState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when ClearFavNoticiasEvent is called and failed ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(ClearFavNoticiasEvent(mockTitular)),
    setUp: () => when(() => mockClearFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<NoticiaErrorState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when GetNoticiasFavEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(GetNoticiasFavEvent()),
    setUp: () => when(() => mockGetFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => const Right(<Titular>[])),
    expect: () => [isA<NoticiaLoadedState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when GetNoticiasFavEvent is called and failed ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(GetNoticiasFavEvent()),
    setUp: () => when(() => mockGetFavsNewsUseCase.call(any()))
        .thenAnswer((invocation) async => Left(mockFailure)),
    expect: () => [isA<NoticiaErrorState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when CategoryNewsSelectionEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(CategoryNewsSelectionEvent(1, false)),
    expect: () => [isA<NoticiaLoadedState>()],
  );
  blocTest<NoticiaBloc, NoticiaState>(
    "Emit[NoticiaLoadedState] when ResetNewsCategoryEvent is called and succesfully ",
    build: () => noticiaBloc,
    seed: () => const NoticiaInitialState(),
    act: (bloc) => bloc.add(ResetNewsCategoryEvent()),
    expect: () => [isA<NoticiaLoadedState>()],
  );
}
