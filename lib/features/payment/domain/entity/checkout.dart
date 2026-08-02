class PaymentEntity {
  final String status;
  final SessionEntity session;

  PaymentEntity({required this.status, required this.session});
}

class SessionEntity {
  final String url;
  final String successUrl;
  final String cancelUrl;

  SessionEntity({
    required this.url,
    required this.successUrl,
    required this.cancelUrl,
  });
}
