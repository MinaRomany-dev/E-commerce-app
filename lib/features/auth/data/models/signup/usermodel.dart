import 'package:ecommerce2/features/auth/domain/entities/user.dart';

class UserModel extends User {
const  UserModel({required super.name, required super.email, required super.role});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], role: json['role']);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'role': role};
  }
}
