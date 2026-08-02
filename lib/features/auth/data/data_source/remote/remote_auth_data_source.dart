import 'package:ecommerce2/features/auth/data/models/forgetresponse.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signin/signinresponse.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_response.dart';

abstract class RemoteauthDatasource {
  Future<Signinresponse> login(Signinrequest request);
  Future<Signupresponse> register(Signuprequest request);
  Future<Forgetresponse> forgetPassword(String email);
  Future<void> verifyCode(String resetCode);
  Future<void> resetPassword(String email, String newPassword);
  Future<void> verifyToken();
}
