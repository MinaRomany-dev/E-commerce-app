import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/payment/data/models/checkout_response.dart';
import 'package:ecommerce2/features/payment/data/datasoure/payment_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PaymentDataSource)
class ApiPaymentDatasource implements PaymentDataSource {
  final ApiManager apiManager;
  ApiPaymentDatasource(this.apiManager);
@override
  Future<CheckoutResponse> addCheckout(String cardId) async {
    try {
      final response = await apiManager.postData(
        queryParameters: {
          "url": "http://10.0.2.2:3000",
        },
        endPoint: "${Constants.checkoutEndPoint}/$cardId",
      );
      return CheckoutResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to Checkout, try again later");
    }
  }
}
