import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/auth/data/models/forgetresponse.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, User>> login(Signinrequest request);
  Future<Either<AppFailure, User>> register(Signuprequest request);
  Future<Either<AppFailure, void>> logout();

  Future<Either<AppFailure, Forgetresponse>> forgetPassword(String email);
  Future<Either<AppFailure, void>> verifyCode(String resetCode);
  Future<Either<AppFailure, void>> resetPassword(
    String email,
    String newPassword,
  );
}
