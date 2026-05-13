import 'package:dio/dio.dart';
import 'package:ecommerce2/core/error/exceptions.dart';

AppExceptions handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.cancel:
      return NetworkException("Please check your  connection ");
    case DioExceptionType.badResponse:
      final statuscode = e.response?.statusCode;
 final msg = e.response?.data["message"];
      if (statuscode == 404) {
        return ServerException("Not found 404");
      } else if (statuscode == 401) {
       
        return ServerException(msg ?? "Unauthorized");
      } else if (statuscode == 403) {
        return ServerException( msg ??"Forbidden");
      } else if (statuscode == 422) {
        return ServerException( msg ?? "Validation error");
      } else if (statuscode != null && statuscode >= 500) {
        return ServerException( msg ?? "Server error");
      }
      return ServerException("Something went wrong");
    default:
      if (e.error is FormatException) {
        return ServerException("Data parsing error");
      }
      return ServerException("Unexpected error");
  }
}
