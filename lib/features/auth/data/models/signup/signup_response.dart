import 'usermodel.dart';

class Signupresponse {
  String message;
  UserModel user;
  String token;

  Signupresponse({
    required this.message,
    required this.user,

    required this.token,
  });

  factory Signupresponse.fromJson(Map<String, dynamic> json) {
    return Signupresponse(
      message: json['message'],
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'],
    );
  }
}
