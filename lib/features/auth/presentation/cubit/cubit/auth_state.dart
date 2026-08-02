import 'package:ecommerce2/features/auth/data/models/forgetresponse.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {
  final String message;
  RegisterError(this.message);
}
final class LogoutSuccess extends AuthState {}

final class LogoutError extends AuthState {
  final String message;
  LogoutError(this.message);
}
// ------------------ Forget Password (Send OTP) ------------------
class ForgetPasswordLoading extends AuthState {}
 
class ForgetPasswordSuccess extends AuthState {
  final Forgetresponse response;
  ForgetPasswordSuccess(this.response);
}
 
class ForgetPasswordError extends AuthState {
  final String message;
  ForgetPasswordError(this.message);
}
 
// ------------------ Verify Code ------------------
class VerifyCodeLoading extends AuthState {}
 
class VerifyCodeSuccess extends AuthState {}
 
class VerifyCodeError extends AuthState {
  final String message;
  VerifyCodeError(this.message);
}
 
// ------------------ Reset Password ------------------
class ResetPasswordLoading extends AuthState {}
 
class ResetPasswordSuccess extends AuthState {}
 
class ResetPasswordError extends AuthState {
  final String message;
  ResetPasswordError(this.message);
}
 
