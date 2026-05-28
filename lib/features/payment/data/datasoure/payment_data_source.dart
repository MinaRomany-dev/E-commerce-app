import 'package:ecommerce2/features/payment/data/models/checkout_response.dart';

abstract class PaymentDataSource {
  Future<CheckoutResponse> addCheckout(String cardId);
}
