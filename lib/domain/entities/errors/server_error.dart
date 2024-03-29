class ServerError {
  ServerError({
    this.rawError,
    this.errorCode,
    this.localizedError,
  });

  RawError? rawError;
  int? errorCode;
  String? localizedError;
}

class RawError {
  RawError({
    this.reason,
    this.errorValues,
  });

  String? reason;

  //list AddressExtra, puede llegar mas de 1
  AddressExtra? errorValues;
}

class ErrorValues {
  ErrorValues({
    this.addressExtra,
  });

  AddressExtra? addressExtra;
}

class AddressExtra {
  AddressExtra({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  String? value;
  String? msg;
  String? param;
  String? location;
}
