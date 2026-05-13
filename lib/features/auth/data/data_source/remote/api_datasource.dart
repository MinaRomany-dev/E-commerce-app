import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/features/auth/data/data_source/remote/auth_datasource.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signin/signinresponse.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_response.dart';

@Singleton(as: RemoteauthDatasource)
class ApiDataSource extends RemoteauthDatasource {
  ApiManager apimanager;
  ApiDataSource({required this.apimanager});

  @override
  Future<Signinresponse> login(Signinrequest request) async {
    try {
      final response = await apimanager.postData(
        endPoint: Constants.signinEndPoint,
        body: request.toJson(),
      );

      return Signinresponse.fromJson(response.data);
    } catch (exception, stack) {
      print('🧨 $stack');
      if (exception is DioException) {
        throw handleDioError(exception);
      }
      throw ServerException("Failed to Login");
    }
  }

  @override
  Future<Signupresponse> register(Signuprequest request) async {
    try {
      final response = await apimanager.postData(
        endPoint: Constants.signupEndPoint,
        body: request.toJson(),
      );
      return Signupresponse.fromJson(response.data);
    } catch (exception, stack) {
      print('🧨 $stack');
      if (exception is DioException) {
        throw handleDioError(exception);
      }
      throw ServerException("Failed to register");
    }
  }
}
