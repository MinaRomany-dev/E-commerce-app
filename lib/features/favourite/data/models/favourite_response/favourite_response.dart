import 'package:ecommerce2/core/models/product_model.dart';

class FavouriteResponse {
  final String status;
  final int count;
  final List<ProductModel> products;

  const FavouriteResponse({
    required this.status,
    required this.count,
    required this.products,
  });

  factory FavouriteResponse.fromJson(Map<String, dynamic> json) {
    return FavouriteResponse(
      status: json['status'] as String,
      count: json['count'] as int,
      products: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
