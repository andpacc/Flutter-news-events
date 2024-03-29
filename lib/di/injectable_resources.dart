import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class InjectableResources {
  @preResolve
  Future<SharedPreferences> get storage => SharedPreferences.getInstance();

  @Named("BaseUrl")
  String get baseUrl =>
    
      'http://localhost:8000';

  @singleton
  @preResolve
  Future<SupabaseClient> get supabase async {
    await dotenv.load(fileName: ".env");

    return SupabaseClient(
      dotenv.env["SUPABASE_URL_KEY"] ?? '',
      dotenv.env["SUPABASE_ANNON_KEY"] ?? '',
    );
  }

  @factoryMethod
  http.Client get httpClient => http.Client();
}
