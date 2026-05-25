import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';

abstract class CartRepository {
  Future<Either<AppFailure, void>> addProductToCart(String productId);
  Future<Either<AppFailure, CartDataEntity>> removeProductFromCart(
    String productId,
  );
  Future<Either<AppFailure, CartDataEntity>> getCartProducts();
  Future<Either<AppFailure, CartDataEntity>> clearCart();
  Future<Either<AppFailure, CartDataEntity>> updateCartItemQuantity(
    int count,
    String productId,
  );
}
