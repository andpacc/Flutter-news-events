// ignore_for_file: public_member_api_docs, sort_constructors_first
//! This constants must contain all the required conted for create a server call

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

///Api State define the server pointer. In change process for locale varible in the building proccess
class ApiState {
  static const String production = 'production';
  static const String development = 'development';
  static const String beta = 'beta';
}

///Api configuration will provide:
///  * An apiBase that must be call on endpoint
///  * Optional (Any kind of token)
class ApiConfiguration {
  final String entorno;
  final String apiBase;

  ApiConfiguration({required this.apiBase, required this.entorno});
}

///Api Headers must contain the required datasource standard header
@singleton
class ApiHeaders {
  Map<String, String> get nonTokenHeader {
    return {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Device-Language': Intl.getCurrentLocale(),
      'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token',
      'Access-Control-Allow-Origin': '*'
    };
  }

  Map<String, String> loggedHeader(String bearerToken) {
    return {
      'Authorization': bearerToken,
      'Device-Language': Intl.getCurrentLocale(),
      'Content-Type': 'application/json',
      'X-Custom-Header': '',
      'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token',
      'Access-Control-Allow-Origin': '*'
    };
  }
}

///Usually the endpoints that will be call in the data source
class ApiEndpoints {
  // static const String login = ApiConfiguration.apiBase + '/auth/login';
}
