import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/domain/use_case/login.dart';
import 'package:ecommerce2/features/auth/domain/use_case/register.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase login;
  final RegisterUseCase register;
  AuthCubit(this.login, this.register) : super(AuthInitial());

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
}
