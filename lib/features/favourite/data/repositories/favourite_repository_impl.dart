import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/core/error/failure_handler.dart';
import 'package:ecommerce2/features/favourite/data/datasource/favo_data_source.dart';
import 'package:ecommerce2/features/favourite/domain/repo/favourite_repository.dart';
import 'package:ecommerce2/features/home/data/datasource/mappers/product_mapper.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoRepository)
class FavoRepositoryImpl implements FavoRepository {
  final FavoDataSource favodatasource;
  FavoRepositoryImpl(this.favodatasource);
  @override
  Future<Either<AppFailure, void>> addProductToFavo(String productId) async {
    try {
      await favodatasource.addProductToFavo(productId);

      return Right(null);
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<ProductEntity>>> getFavoProducts() async {
    try {
      final response = await favodatasource.getFavoProductsIds();
      return Right(response.products.map((e) => e.toEntity()).toList());
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, void>> removeProductFromFavo(
    String productId,
  ) async {
    try {
      await favodatasource.removeProductFromFavo(productId);

      return Right(null);
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
