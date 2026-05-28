import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/favourite/data/datasource/favo_data_source.dart';
import 'package:ecommerce2/features/favourite/data/models/favourite_response/favourite_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: FavoDataSource)
class ApiFavoDataSource implements FavoDataSource {
  final ApiManager apiManager;
  Logger logger;
  ApiFavoDataSource(this.apiManager, this.logger);

  @override
  Future<FavouriteResponse> getFavoProductsIds() async {
    try {
      final response = await apiManager.getData(
        endPoint: Constants.favoriteEndPoint,
      );
      return FavouriteResponse.fromJson(response.data);
    } catch (e) {
      logger.f("🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to get Favo Data");
    }
  }

  @override
  Future<void> removeProductFromFavo(String productId) async {
    try {
      await apiManager.deleteData(
        endPoint: "${Constants.favoriteEndPoint}/$productId",
      );
    } catch (e) {
      logger.f("🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to delete this item");
    }
  }

  @override
  Future<void> addProductToFavo(String productId) async {
    try {
      await apiManager.postData(
        endPoint: Constants.favoriteEndPoint,
        body: {"productId": productId},
      );
    } catch (e) {
      logger.f("🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to add Product this item ");
    }
  }
}
