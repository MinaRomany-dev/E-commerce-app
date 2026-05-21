import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<AppFailure, CartResponseEntity>> addProductToCart(
    String productId,
  );
  Future<Either<AppFailure, CartResponseEntity>> removeProductFromCart(
    String productId,
  );
  Future<Either<AppFailure, CartDataEntity>> getCartProducts();
  Future<Either<AppFailure, CartResponseEntity>> clearCart();
  Future<Either<AppFailure, CartResponseEntity>> updateCartItemQuantity(
    int count,
    String productId,
  );
}
