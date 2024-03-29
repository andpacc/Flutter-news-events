import 'package:bloc_test/bloc_test.dart';
import 'package:example/presentation/pages/play/music_play/music_bloc/play_music_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'music_bloc_mock.dart';

void main() {
  late MockGetMusicUseCase mockGetMusicUseCase;
  late MockGetMusicCategoryUseCase mockGetMusicCategoryUseCase;

  setUp(() {
    mockGetMusicUseCase = MockGetMusicUseCase();
    mockGetMusicCategoryUseCase = MockGetMusicCategoryUseCase();
  });

  blocTest(
    "Emit [PlayMusicLoadedState] when InitializeMusicEvent is called",
    build: () =>
        PlayMusicBloc(mockGetMusicUseCase, mockGetMusicCategoryUseCase),
    act: (bloc) => bloc.add(InitializeMusicEvent()),
  );
}
