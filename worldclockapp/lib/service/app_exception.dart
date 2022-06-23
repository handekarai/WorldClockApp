class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

// for any status code except from status code 400
class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

// for status code 400
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
