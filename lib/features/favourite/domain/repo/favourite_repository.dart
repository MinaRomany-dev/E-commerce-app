import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';

abstract class FavoRepository {
  Future<Either<AppFailure, void>> addProductToFavo(String productId);
  Future<Either<AppFailure, void>> removeProductFromFavo(String productId);
  Future<Either<AppFailure, List<ProductEntity>>> getFavoProducts();
}
