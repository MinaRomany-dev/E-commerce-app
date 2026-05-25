import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/cart/domain/repo/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddProductTocartUsecase {
  final CartRepository cartRepository;
  const AddProductTocartUsecase(this.cartRepository);
  
  Future<Either<AppFailure, void>> call(String productId) =>  cartRepository.addProductToCart(productId);
 
}
