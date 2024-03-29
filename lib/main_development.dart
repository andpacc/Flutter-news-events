import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'app.dart' as app;
import 'data/data_constants.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(bloc, event) {
    developer.log('$event', name: 'SimpleBlocObserver');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    developer.log('$transition', name: 'SimpleBlocObserver');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log('$error',
        name: 'SimpleBlocObserver', error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

main() async {
  ApiConfiguration apiConfiguration =
      ApiConfiguration(apiBase: ApiState.development, entorno: 'dev');

  //Setting an observer that will be print every state change
  Bloc.observer = SimpleBlocObserver();
  app.launch(apiConfiguration);
}
