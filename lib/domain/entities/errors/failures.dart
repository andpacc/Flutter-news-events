// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class Failure {
  String? get msg => null;
  Failure([List properties = const <dynamic>[]]);
}

// general failures
class ServerFailure extends Failure {
  @override
  final String? msg;
  final String? param;
  final int? statusCode;

  ServerFailure({this.msg, this.param, this.statusCode});
}

class ProductTransactionOutDateFailure extends Failure {
  final int? statusCode;

  ProductTransactionOutDateFailure({this.statusCode});
}

class InvalidParamsFailure extends Failure {
  final String errorCode;

  InvalidParamsFailure({this.errorCode = ""});
}

class NoDataFailure extends Failure {}

class NoFileFailure extends Failure {}

class OperationFailure extends Failure {
  @override
  final String? msg;

  OperationFailure({this.msg});
}

class ProjectDirectoryFailure extends Failure {}

class NoRootFailure extends Failure {}

class ProjectExistsFailure extends Failure {
  @override
  final String? msg;
  ProjectExistsFailure({
    this.msg,
  });
}

class ProjectCreationFailure extends Failure {
  @override
  final String? msg;
  ProjectCreationFailure({
    this.msg,
  });
}

class CanceledFailure extends Failure {}
