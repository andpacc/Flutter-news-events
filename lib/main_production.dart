import 'app.dart' as app;
import 'data/data_constants.dart';

main() async {
  ApiConfiguration apiConfiguration =
      ApiConfiguration(apiBase: ApiState.production, entorno: 'prod');

  app.launch(apiConfiguration);
}
