import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/failure/failure.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/domain/entities/user.dart';
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class  LoginUseCase {
final AuthRepository authRepository;
 const LoginUseCase(
     this.authRepository,
  );

   Future<Either<Failure, User>> call(Signinrequest request) {
    return authRepository.login(request);
  }
}
