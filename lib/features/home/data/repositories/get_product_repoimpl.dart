import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/core/error/failure_handler.dart';
import 'package:ecommerce2/features/home/data/datasource/mappers/product_mapper.dart';
import 'package:ecommerce2/features/home/data/datasource/remote/home_datasource.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/home/domain/repo/product_reposiroty.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductReposiroty)
class ProductRepoimpl implements ProductReposiroty {
  final HomeDatasource homeDatasource;
  ProductRepoimpl({required this.homeDatasource});
@override
  Future<Either<AppFailure, List<ProductEntity>>> getProducts(int? pagenumber) async {
    try {
      final response = await homeDatasource.getProducts(pagenumber);

      return Right(response.products?.map((e) => e.toEntity()).toList() ?? []);
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
