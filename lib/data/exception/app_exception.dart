class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "No Data Found");
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "Invalid URL Request");
}

class UnAutoriseException extends AppException {
  UnAutoriseException([String? message]) : super(message, "Unauthorise User");
}

class InputDataException extends AppException {
  InputDataException([String? message])
      : super(message, "Invalid Username and Password");
}
