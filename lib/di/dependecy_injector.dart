import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'dependecy_injector.config.dart';

///Dependency injector provide by get_it
final sl = GetIt.instance;

@InjectableInit(
  asExtension: true,
)
Future<void> configureDependencies(String environment) async =>
    sl.init(environment: environment);
