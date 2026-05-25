import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';
import 'package:ecommerce2/features/cart/domain/repo/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ClearCartUsecase {
  final CartRepository cartRepository;

  const ClearCartUsecase(this.cartRepository);


  Future<Either<AppFailure, CartDataEntity>> call() async =>
      await cartRepository.clearCart();
}
