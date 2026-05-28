import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/core/error/failure_handler.dart';
import 'package:ecommerce2/features/cart/data/data_source/cart_data_source.dart';
import 'package:ecommerce2/features/cart/data/mappers/cart_data_mappers.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';
import 'package:ecommerce2/features/cart/domain/repo/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartDataSource cartDataSource;
  CartRepositoryImpl(this.cartDataSource);
  @override
  Future<Either<AppFailure, void>> addProductToCart(String productId) async {
    try {
      await cartDataSource.addProductToCart(productId);

      return Right(null);
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, CartDataEntity>> getCartProducts() async {
    try {
      final result = await cartDataSource.getCartData();

      return Right(result.cartdata.toEntity());
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, CartDataEntity>> removeProductFromCart(
    String productId,
  ) async {
    try {
      final result = await cartDataSource.removeCartItem(productId);

      return Right(result.cartdata.toEntity());
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, CartDataEntity>> clearCart() async {
    try {
      final result = await cartDataSource.clearCart();

      return Right(result.cartdata.toEntity());
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, CartDataEntity>> updateCartItemQuantity(
    int count,
    String productId,
  ) async {
    try {
      final result = await cartDataSource.updateCartItemQuantity(
        count,
        productId,
      );

      return Right(result.cartdata.toEntity());
    } on AppExceptions catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
