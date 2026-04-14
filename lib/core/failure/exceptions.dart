abstract class AppExceptions implements Exception {
  final String errormsg;
  const AppExceptions(this.errormsg);
}

class RemoteException extends AppExceptions {
const   RemoteException(super.errormsg);
}

class LocalException extends AppExceptions {
 const LocalException(super.errormsg);
}
