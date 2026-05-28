import 'package:ecommerce2/core/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCacheProducts();
  Future<void> cacheProducts(List<ProductModel> products);
  Future<void> clearCachedProducts();
}
