import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String supabaseKey =
      dotenv.env["SUPABASE_URL_KEY"] ?? "NO HAY API KEY";

  static String supabaseAnnonApi =
      dotenv.env["SUPABASE_ANNON_KEY"] ?? "no hay api key anonima";
}
