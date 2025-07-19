class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? _message]) : super(_message, 'Failed to Fetch\n');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? _message]) : super(_message, "Request Time Out");
}

class InvalidUrl extends AppException {
  InvalidUrl([String? _message]) : super(_message, "Invalid Url");
}

class FailedToFetch extends AppException {
  FailedToFetch([String? _message]) : super(_message, "Faild to fetch");
}
