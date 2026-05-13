import 'package:dio/dio.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late final Dio dio;
  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        followRedirects: true,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  /// GET
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }

  /// POST
  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return dio.post(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }

  /// PUT
  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return dio.put(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }

  /// DELETE
  Future<Response> deleteData({
    required String endPoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return dio.delete(
      endPoint,
      data: body,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }
}
