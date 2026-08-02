import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class LogoutUsecase {
  final AuthRepository authRepository;
  LogoutUsecase(this.authRepository);
  Future<Either<AppFailure, void>> call() async {
    return await authRepository.logout();
  }
}
