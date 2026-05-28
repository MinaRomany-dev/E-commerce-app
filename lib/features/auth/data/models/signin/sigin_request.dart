class Signinrequest {
  String email;
  String password;

  Signinrequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
