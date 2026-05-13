abstract class AppFailure {
  final String failmessage;
  const AppFailure(this.failmessage);
}

class NetworkFailure extends AppFailure {
  const NetworkFailure(super.failmessage);
}

class AuthFailure extends AppFailure {
  const AuthFailure(super.failmessage);
}

class ServerFailure extends AppFailure {
  const ServerFailure(super.failmessage);
}

class LocalFailure extends AppFailure {
  const LocalFailure(super.failmessage);
}
