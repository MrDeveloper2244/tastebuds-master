    class AppExceptions implements Exception {
  final _message;
  final _perfix;

  AppExceptions([this._message, this._perfix]);

  String toString() {
    return '$_perfix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No Internet');
}


class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, 'Request Timeout');
}



class LocationPermission extends AppExceptions {
  LocationPermission([String? message]) : super(message, 'Location Not Enabled');
}



class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Server Exception');
}



class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}


class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}


class InvalidUsernameException extends AppExceptions {
  InvalidUsernameException([String? message]) : super(message,"");
}