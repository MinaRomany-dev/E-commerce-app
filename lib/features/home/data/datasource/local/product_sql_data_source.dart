import 'package:ecommerce2/core/caching/database_sql.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/home/data/datasource/local/product_local_data_source.dart';
import 'package:ecommerce2/features/home/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductLocalDataSource)
class ProductSqlDataSource implements ProductLocalDataSource {
  final DatabaseHelper databaseHelper;
  ProductSqlDataSource({required this.databaseHelper});
  @override
  Future<List<ProductModel>> getCacheProducts() async {
    try {
      final result = await databaseHelper.getData(table: 'products');
      final products = result.map((e) => ProductModel.fromMap(e)).toList();
      return products;
    } catch (e) {
      throw LocalException('Failed to get Cached Products');
    }
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    try {
      await databaseHelper.insertBatch(
        table: 'products',
        dataList: products.map((e) => e.toJson()).toList(),
      );
    } catch (e) {
      throw LocalException("Failed to cache products");
    }
  }

  @override
  Future<void> clearCachedProducts() async {
    try {
      await databaseHelper.clearTable('products');
    } catch (e) {
      throw LocalException('Failed to delete Cached Products');
    }
  }
}
