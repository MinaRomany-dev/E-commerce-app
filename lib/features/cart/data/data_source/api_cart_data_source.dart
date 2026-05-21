import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/cart/data/data_source/cart_data_source.dart';
import 'package:ecommerce2/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: CartDataSource)
class ApiCartDataSource extends CartDataSource {
  final Logger logger;
  final ApiManager apiManager;
  ApiCartDataSource(this.apiManager, this.logger);

  @override
  Future<CartResponseModel> clearCart() async {
    try {
      final response = await apiManager.deleteData(
        endPoint: Constants.cartEndPoint,
      );
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      logger.f(" 🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to clear Cart Data");
    }
  }

  @override
  Future<CartResponseModel> removeCartItem(String productId) async {
    try {
      final response = await apiManager.deleteData(
        endPoint: "${Constants.cartEndPoint}/$productId",
      );
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      logger.f(" 🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to delete this item");
    }
  }

  @override
  Future<CartResponseModel> getCartData() async {
    try {
      final response = await apiManager.getData(
        endPoint: Constants.cartEndPoint,
      );
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      logger.f(" 🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CartResponseModel> updateCartItemQuantity(
    int count,
    String productId,
  ) async {
    try {
      final response = await apiManager.putData(
        body: {"count": count},
        endPoint: "${Constants.cartEndPoint}/$productId",
      );
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      logger.f(" 🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to update Cart ");
    }
  }

  @override
  Future<CartResponseModel> addProductToCart(String productId) async {
    try {
      final response = await apiManager.postData(
        body: {"productId": productId},
        endPoint: Constants.cartEndPoint,
      );
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      logger.f(" 🧨 error is  $e, stackTrace: ${StackTrace.current}");
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to add Product to Cart ");
    }
  }
}
