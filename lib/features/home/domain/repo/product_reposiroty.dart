import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';

abstract class ProductReposiroty  {
    Future<Either<AppFailure, List<ProductEntity>>> getProducts(int? pagenumber);
}