import 'package:ecommerce2/features/cart/data/models/cart_product_model.dart';

class CartDataModel {
  final String id;
  final String cartOwner;
  final List<CartProductModel> products;
  final String createdAt;
  final String updatedAt;
  final int totalCartPrice;

  CartDataModel({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      id: json['_id'] ?? '',
      cartOwner: json['cartOwner'] ?? '',
      products:
          (json['products'] as List?)
              ?.map((e) => CartProductModel.fromJson(e))
              .toList() ??
          [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      totalCartPrice: json['totalCartPrice'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "cartOwner": cartOwner,
      "products": products.map((e) => e.toJson()).toList(),
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "totalCartPrice": totalCartPrice,
    };
  }
}
