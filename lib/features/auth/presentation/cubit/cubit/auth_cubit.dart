import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/domain/use_case/forget_usecase.dart';
import 'package:ecommerce2/features/auth/domain/use_case/login.dart';
import 'package:ecommerce2/features/auth/domain/use_case/logout_usecase.dart';
import 'package:ecommerce2/features/auth/domain/use_case/register.dart';
import 'package:ecommerce2/features/auth/domain/use_case/reset_password_usecase.dart';
import 'package:ecommerce2/features/auth/domain/use_case/verify_code_usecase.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final LogoutUsecase logout;
  final LoginUseCase login;
  final RegisterUseCase register;

  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  AuthCubit(
    this.forgetPasswordUseCase,
    this.verifyCodeUseCase,
    this.resetPasswordUseCase,
    this.logout,
    this.login,
    this.register,
  ) : super(AuthInitial());

  Future<void> Login(Signinrequest request) async {
    emit(LoginLoading());

    final result = await login(request);
    result.fold(
      (failure) => emit(LoginError(failure.failmessage)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> Register(Signuprequest request) async {
    emit(RegisterLoading());

    final result = await register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.failmessage)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> Logout() async {
    final result = await logout();
    result.fold(
      (failure) => emit(LogoutError(failure.failmessage)),
      (_) => emit(LogoutSuccess()),
    );
  }

  Future<void> sendOtp(String email) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUseCase(email);
    result.fold(
      (failure) => emit(ForgetPasswordError(failure.failmessage)),
      (response) => emit(ForgetPasswordSuccess(response)),
    );
  }

  Future<void> verifyCode(String resetCode) async {
    emit(VerifyCodeLoading());
    final result = await verifyCodeUseCase(resetCode);
    result.fold(
      (failure) => emit(VerifyCodeError(failure.failmessage)),
      (_) => emit(VerifyCodeSuccess()),
    );
  }

  Future<void> reset(String email, String newPassword) async {
    emit(ResetPasswordLoading());
    final result = await resetPasswordUseCase(
      ResetPasswordParams(email: email, newPassword: newPassword),
    );
    result.fold(
      (failure) => emit(ResetPasswordError(failure.failmessage)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }
}
