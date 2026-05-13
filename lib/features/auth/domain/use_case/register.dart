import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/domain/entities/user.dart';
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepository authRepository;
  const RegisterUseCase(this.authRepository);

  Future<Either<AppFailure, User>> call(Signuprequest request) {
    return authRepository.register(request);
  }
}
