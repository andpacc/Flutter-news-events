import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/titular.dart';
import 'package:example/domain/usecases/get_news.dart';
import 'package:example/domain/usecases/get_news_category_usecase.dart';
import 'package:example/domain/usecases/get_news_favs.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsUseCase extends Mock implements GetNewsUseCase {}

class MockAddFavsNewsUseCase extends Mock implements AddFavsNewsUseCase {}

class MockClearAllFavsNewsUseCase extends Mock
    implements ClearAllFavsNewsUseCase {}

class MockClearFavsNewsUseCase extends Mock implements ClearFavsNewsUseCase {}

class MockGetFavsNewsUseCase extends Mock implements GetFavsNewsUseCase {}

class MockGetNewsCategoryUseCase extends Mock
    implements GetNewsCategoryUseCase {}

class MockFailure extends Mock implements Failure {}

class MockTitular extends Mock implements Titular {}
