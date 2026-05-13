import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/core/error/failure.dart';

AppFailure mapExceptionToFailure(AppExceptions e) {
  if (e is NetworkException) {
    return NetworkFailure(e.errormsg);
  } else if (e is ServerException) {
    return ServerFailure(e.errormsg);
  } else if (e is LocalException) {
    return LocalFailure(e.errormsg);
  } else if (e is AuthException) {
    return AuthFailure(e.errormsg);
  }
  return ServerFailure("Server error ,try again");
}
