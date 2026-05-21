import 'package:ecommerce2/features/home/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCacheProducts();
  Future<void> cacheProducts(List<ProductModel> products);
  Future<void> clearCachedProducts();
}
