import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

class ResetPasswordParams {
  final String email;
  final String newPassword;

  const ResetPasswordParams({required this.email, required this.newPassword});
}

@injectable
class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<AppFailure, void>> call(ResetPasswordParams params) {
    return repository.resetPassword(params.email, params.newPassword);
  }
}