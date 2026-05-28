import 'package:ecommerce2/features/auth/data/models/usermodel.dart';
import 'package:ecommerce2/features/auth/domain/entities/user.dart';

extension UserMappers on UserModel {
  User get toEntity => User(name: name, email: email, role: role);
}
