import 'session.dart';

class CheckoutResponse {
  String status;
  Session session;

  CheckoutResponse({required this.status, required this.session});

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutResponse(
      status: json['status'] as String,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );
  }
}
