import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/cart/data/models/cart_data_model.dart';

class CartResponseModel {
  final String status;
  final String? message;
  final int numOfCartItems;
  final String cartId;
  final CartDataModel cartdata;

  CartResponseModel({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.cartdata,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      status: json['status'] ?? 'error',
      message: json['message'] ?? 'error',
      numOfCartItems: json['numOfCartItems'] ?? 0,
      cartId: json['cartId'] ?? '',
      cartdata: json['data'] != null
          ? CartDataModel.fromJson(json['data'])
          : throw ServerException("Cart data is null"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "numOfCartItems": numOfCartItems,
      "cartId": cartId,
      "data": cartdata.toJson(),
    };
  }
}
