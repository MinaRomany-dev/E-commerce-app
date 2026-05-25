import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';
import 'package:ecommerce2/features/cart/domain/repo/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateCartitemQuantityUsecase {
  final CartRepository cartRepository;

  const UpdateCartitemQuantityUsecase(this.cartRepository);

  Future<Either<AppFailure, CartDataEntity>> call(
    int count,
    String productId,
  ) async 
      => await cartRepository.updateCartItemQuantity(count, productId);
}
