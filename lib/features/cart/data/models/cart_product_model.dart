import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/home/data/models/product_model.dart';

class CartProductModel {
  final int? count;
  final String id;
  final ProductModel product;
  final int? price;

  CartProductModel({
    this.count,
    required this.id,
    required this.product,
    this.price,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      count: json['count'],
      id: json['_id'],
      product: ProductModel.fromJson(
        json['product'] ?? (throw ServerException("Product is null")),
      ),

      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      "_id": id,
      "product": product.toJson(),
      "price": price,
    };
  }
}
