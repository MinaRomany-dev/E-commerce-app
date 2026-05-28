

import 'package:ecommerce2/features/payment/data/models/checkout_response.dart';
import 'package:ecommerce2/features/payment/domain/entity/checkout.dart';

extension CheckoutMapper on CheckoutResponse {
  PaymentEntity toEntity() {
    return PaymentEntity(
      status: status,
      session: SessionEntity(
        url: session.url,
        successUrl: session.successUrl,
        cancelUrl: session.cancelUrl,
      ),
    );
  }
}
