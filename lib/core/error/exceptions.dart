abstract class AppExceptions implements Exception {
  final String errormsg;
  const AppExceptions(this.errormsg);
}

class AuthException extends AppExceptions {
  const AuthException(super.errormsg);
}

class ServerException extends AppExceptions {
  const ServerException(super.errormsg);
}

class NetworkException extends AppExceptions {
  const NetworkException(super.errormsg);
}

class LocalException extends AppExceptions {
  const LocalException(super.errormsg);
}
