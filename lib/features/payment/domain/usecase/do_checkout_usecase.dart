import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/payment/domain/entity/checkout.dart';
import 'package:ecommerce2/features/payment/domain/repo/checkout_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCheckoutUsecase {
  final PaymentRepository repository;

  AddCheckoutUsecase(this.repository);

  Future<Either<AppFailure, PaymentEntity>> call(String cartId) async {
    return await repository.addCheckout(cartId);
  }
}
