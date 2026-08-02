// import 'package:dio/dio.dart';
// import 'package:ecommerce2/core/api/api_manager.dart';
// import 'package:ecommerce2/core/error/error_handler.dart';
// import 'package:ecommerce2/core/error/exceptions.dart';
// import 'package:ecommerce2/features/auth/data/data_source/remote/remote_auth_data_source.dart';
// import 'package:ecommerce2/features/auth/data/models/forgetresponse.dart';
// import 'package:injectable/injectable.dart';
// import 'package:ecommerce2/core/constants/constants.dart';
// import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
// import 'package:ecommerce2/features/auth/data/models/signin/signinresponse.dart';
// import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
// import 'package:ecommerce2/features/auth/data/models/signup/signup_response.dart';

// @Singleton(as: RemoteauthDatasource)
// class ApiDataSource extends RemoteauthDatasource {
//   ApiManager apimanager;
//   ApiDataSource({required this.apimanager});

//   @override
//   Future<Signinresponse> login(Signinrequest request) async {
//     try {
//       final response = await apimanager.postData(
//         endPoint: Constants.signinEndPoint,
//         body: request.toJson(),
//       );

//       return Signinresponse.fromJson(response.data);
//     } catch (exception, stack) {
//       print('🧨 $stack');
//       if (exception is DioException) {
//         throw handleDioError(exception);
//       }
//       throw ServerException("Failed to Login");
//     }
//   }

//   @override
//   Future<Signupresponse> register(Signuprequest request) async {
//     try {
//       final response = await apimanager.postData(
//         endPoint: Constants.signupEndPoint,
//         body: request.toJson(),
//       );
//       return Signupresponse.fromJson(response.data);
//     } catch (exception, stack) {
//       print('🧨 $stack');
//       if (exception is DioException) {
//         throw handleDioError(exception);
//       }
//       throw ServerException("Failed to register");
//     }
//   }

//   @override
//   Future<Forgetresponse> forgetPassword(String email) {
//     // TODO: implement forgetPassword
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> resetPassword(String email, String newPassword) {
//     // TODO: implement resetPassword
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> verifyCode(String resetCode) {
//     // TODO: implement verifyCode
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> verifyToken() {
//     // TODO: implement verifyToken
//     throw UnimplementedError();
//   }
  

// }
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/auth/data/data_source/local/local_datasource.dart';
import 'package:ecommerce2/features/auth/data/data_source/remote/remote_auth_data_source.dart';
import 'package:ecommerce2/features/auth/data/models/forgetresponse.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signin/signinresponse.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_response.dart';

@Singleton(as: RemoteauthDatasource)
class ApiDataSource extends RemoteauthDatasource {
  ApiManager apimanager;
  LocalauthDatasouce localauthDatasouce;
  ApiDataSource({required this.apimanager, required this.localauthDatasouce});

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

  @override
  Future<Forgetresponse> forgetPassword(String email) async {
    try {
      final response = await apimanager.postData(
        endPoint: Constants.forgetPasswordEndPoint,
        body: {'email': email},
      );
      return Forgetresponse.fromJson(response.data);
    } catch (exception, stack) {
      print('🧨 $stack');
      if (exception is DioException) {
        throw handleDioError(exception);
      }
      throw ServerException("Failed to send reset code");
    }
  }

  @override
  Future<void> verifyCode(String resetCode) async {
    try {
      await apimanager.postData(
        endPoint: Constants.verifyResetCodeEndPoint,
        body: {'resetCode': resetCode},
      );
    } catch (exception, stack) {
      print('🧨 $stack');
      if (exception is DioException) {
        throw handleDioError(exception);
      }
      throw ServerException("Failed to verify code");
    }
  }

  @override
  Future<void> resetPassword(String email, String newPassword) async {
    try {
      await apimanager.putData(
        endPoint: Constants.resetPasswordEndPoint,
        body: {'email': email, 'newPassword': newPassword},
      );
    } catch (exception, stack) {
      print('🧨 $stack');
      if (exception is DioException) {
        throw handleDioError(exception);
      }
      throw ServerException("Failed to reset password");
    }
  }

  @override
  Future<void> verifyToken() async {
    try {
      // الـ interceptor في ApiManager بيستثني أي مسار فيه '/auth/' من إضافة
      // الـ token header تلقائي، فلازم نبعته يدوي هنا.
      final token = await localauthDatasouce.getToken();
      await apimanager.getData(
        endPoint: Constants.verifyTokenEndPoint,
        headers: {'token': token ?? ''},
      );
    } catch (exception, stack) {
      print('🧨 $stack');
      if (exception is DioException) {
        throw handleDioError(exception);
      }
      throw ServerException("Failed to verify token");
    }
  }
}