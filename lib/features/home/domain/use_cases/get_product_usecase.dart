import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/home/domain/repo/product_reposiroty.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductUsecase {
  final ProductReposiroty reposiroty;
  GetProductUsecase({required this.reposiroty});

  Future<Either<AppFailure, List<ProductEntity>>> call(int? page) {
    return reposiroty.getProducts(page);
  }
}
