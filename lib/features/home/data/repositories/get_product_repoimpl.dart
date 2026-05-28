import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/core/error/failure_handler.dart';
import 'package:ecommerce2/features/home/data/datasource/local/product_local_data_source.dart';
import 'package:ecommerce2/features/home/data/datasource/mappers/product_mapper.dart';
import 'package:ecommerce2/features/home/data/datasource/remote/remote_product_data_source.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/home/domain/repo/product_reposiroty.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductReposiroty)
class ProductRepoimpl implements ProductReposiroty {
  final RemoteProductDatasource remoteProductDatasource;
  final ProductLocalDataSource localProductDatasource;
  ProductRepoimpl({
    required this.remoteProductDatasource,
    required this.localProductDatasource,
  });

  @override
  Future<Either<AppFailure, List<ProductEntity>>> getProducts(
    int? pagenumber,
  ) async {
    try {
      final response = await remoteProductDatasource.getProducts(pagenumber);
      final products = response.products ?? [];

      if (pagenumber == 1) {
        await localProductDatasource.clearCachedProducts();
      }

      await localProductDatasource.cacheProducts(products);

      return Right(products.map((e) => e.toEntity()).toList());
    } on AppExceptions catch (e) {
      final cached = await localProductDatasource.getCacheProducts();

      if (cached.isNotEmpty) {
        return Right(cached.map((e) => e.toEntity()).toList());
      }

      return Left(mapExceptionToFailure(e));
    }
  }
}
