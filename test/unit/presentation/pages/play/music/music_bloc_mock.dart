import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/usecases/get_music_category_usecase.dart';
import 'package:example/domain/usecases/get_music_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMusicUseCase extends Mock implements GetMusicUseCase {}

class MockGetMusicCategoryUseCase extends Mock
    implements GetMusicCategoryUseCase {}

class MockGetMusicUseCaseParams extends Mock
    implements GetMusicCategoryUseCaseParams {}

class MockGetMusicCategoryUseCaseParams extends Mock
    implements GetMusicCategoryUseCaseParams {}

class MockFailure extends Mock implements Failure {}
