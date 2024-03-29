import 'server_error.dart';

class ServerException implements Exception {
  final ServerError? serverError;
  final int? statusCode;

  ServerException({this.statusCode, this.serverError});
}

class ServiceDisabled implements Exception {}
