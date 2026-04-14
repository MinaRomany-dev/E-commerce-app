import 'package:dio/dio.dart';
import 'package:ecommerce2/core/constants/constans.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {

  @singleton
  Dio get dio =>
      Dio(  BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(seconds: 3),
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),);

  @lazySingleton
  FlutterSecureStorage get storage =>
      const FlutterSecureStorage();
}