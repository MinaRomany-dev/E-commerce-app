import 'package:ecommerce2/features/auth/data/models/signup/usermodel.dart';

class Signinresponse {
  String message;
  UserModel user;
  String token;

  Signinresponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory Signinresponse.fromJson(Map<String, dynamic> json) {
    return Signinresponse(
      message: json['message'],
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'],
    );
  }
}
