import 'package:dio/dio.dart';
import 'package:ecommerce2/core/failure/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce2/core/constants/constans.dart';
import 'package:ecommerce2/features/auth/data/data_source/remote/auth_datasource.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signin/signinresponse.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_response.dart';

@Singleton(as: RemoteauthDatasource)
class ApiDataSource extends RemoteauthDatasource {
  Dio dio;
  ApiDataSource({required this.dio});

  @override
  Future<Signinresponse> login(Signinrequest request) async {
    try {
      final response = await dio.post(Constants.signInendpoint, data: request.toJson());

      return Signinresponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }

      throw RemoteException(message ?? "Failed to Login");
    }
  }

  @override
  Future<Signupresponse> register(Signuprequest request) async {
    try {
      final response = await dio.post(Constants.signUpendpoint, data: request.toJson());

      return Signupresponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }

      throw RemoteException(message ?? "Failed to Register");
    }
  }
}
