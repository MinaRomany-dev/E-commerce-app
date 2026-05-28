import '../../../../core/models/product_model.dart';
import 'metadata.dart';

class ProductResponse {
  int? results;
  Metadata? metadata;
  List<ProductModel>? products;

  ProductResponse({this.results, this.metadata, this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
