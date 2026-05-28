import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';
import 'package:ecommerce2/features/cart/domain/repo/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoveProductFromcartUsecase {
  final CartRepository cartRepository;

  const RemoveProductFromcartUsecase({required this.cartRepository});

  Future<Either<AppFailure, CartDataEntity>> call(String productId) async =>
      await cartRepository.removeProductFromCart(productId);
}
