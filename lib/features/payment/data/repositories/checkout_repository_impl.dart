
import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/payment/data/datasoure/payment_data_source.dart';
import 'package:ecommerce2/features/payment/data/mappers/checkout_mappers.dart';
import 'package:ecommerce2/features/payment/domain/entity/checkout.dart';
import 'package:ecommerce2/features/payment/domain/repo/checkout_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource paymentDataSource;

  PaymentRepositoryImpl(this.paymentDataSource);

  @override
  Future<Either<AppFailure, PaymentEntity>> addCheckout(String cartId) async {
   try{
     final response = await paymentDataSource.addCheckout(cartId);

    return Right(response.toEntity());
   }catch(e){
     return Left(ServerFailure(e.toString()));
   }
  }
}
