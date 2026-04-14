class Signuprequest {
  String name;
  String email;
  String password;
  String phone;

  Signuprequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'rePassword': password,
    'phone': phone,
  };
}
