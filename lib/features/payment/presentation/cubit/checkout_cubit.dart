import 'package:bloc/bloc.dart';
import 'package:ecommerce2/features/payment/domain/entity/checkout.dart';
import 'package:ecommerce2/features/payment/domain/usecase/add_checkout_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';
@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  final AddCheckoutUsecase addCheckoutUsecase;

  CheckoutCubit(this.addCheckoutUsecase) : super(CheckoutInitial());
 
  Future<void> addCheckout(String cartId) async {

    emit(CheckoutLoading());

    final result = await addCheckoutUsecase(cartId);
    result.fold(
      (failure) => emit(CheckoutError(failure.failmessage)),
      (checkout) => emit(CheckoutSuccess( checkout)),
    );
  }
}
