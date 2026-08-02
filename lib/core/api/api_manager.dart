import 'package:dio/dio.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/features/auth/data/data_source/local/local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  final LocalauthDatasouce localauthDatasouce;
  late final Dio dio;
  String? _cachedToken;
  ApiManager(this.localauthDatasouce) {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        followRedirects: true,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isAuthRequest =
              options.path.contains('/signin') ||
              options.path.contains('/signup');

          if (!isAuthRequest) {
            _cachedToken ??= await localauthDatasouce.getToken();

            if (_cachedToken != null && _cachedToken!.isNotEmpty) {
              options.headers["token"] = _cachedToken;

              print(
                " ✅ Token Added from cache: ${_cachedToken!.substring(0, 30)}...",
              );
            } else {
              print("❌ No token in cache!");
            }
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        responseBody: true,
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        compact: true,
        error: true,
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
