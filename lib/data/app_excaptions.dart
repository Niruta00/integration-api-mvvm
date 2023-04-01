class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String tostring() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}
class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Invalid request');
}
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Umathorized request');
}

