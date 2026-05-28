import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/payment/domain/entity/checkout.dart';

abstract class PaymentRepository {
  Future<Either<AppFailure, PaymentEntity>> addCheckout(String cartId);
}
