import 'app.dart' as app;
import 'data/data_constants.dart';

main() async {
  ApiConfiguration apiConfiguration =
      ApiConfiguration(apiBase: ApiState.beta, entorno: 'beta');

  app.launch(apiConfiguration);
}
