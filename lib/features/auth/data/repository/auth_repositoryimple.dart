import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/core/error/failure_handler.dart';
import 'package:ecommerce2/features/auth/data/data_source/local/local_datasource.dart';
import 'package:ecommerce2/features/auth/data/data_source/remote/auth_datasource.dart';
import 'package:ecommerce2/features/auth/data/mappers/user_mappers.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/auth/domain/entities/user.dart';
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  LocalauthDatasouce localauthDatasouce;
  RemoteauthDatasource remoteauthDatasouce;

  AuthRepositoryImpl(this.localauthDatasouce, this.remoteauthDatasouce);
@override
  Future<Either<AppFailure, User>> login(Signinrequest request) async {
    try {
      final response = await remoteauthDatasouce.login(request);

      await localauthDatasouce.saveToken(response.token);

      return Right(response.user.toEntity);
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
@override
  Future<Either<AppFailure, User>> register(Signuprequest request) async {
    try {
      final response = await remoteauthDatasouce.register(request);
      await localauthDatasouce.saveToken(response.token);
      return Right(response.user.toEntity);
    } on AppExceptions catch (e, stack) {
      debugPrint("📌 STACK: $stack");
      debugPrint("🔥 RESPONSE:");
      return left(mapExceptionToFailure(e));
    }
  }
}
