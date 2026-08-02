class Forgetresponse {
  final String statusMsg;
  final String message;

  const Forgetresponse({required this.statusMsg, required this.message});

  factory Forgetresponse.fromJson(Map<String, dynamic> json) {
    return Forgetresponse(
      statusMsg: json['statusMsg'] as String,
      message: json['message'] as String,
    );
  }
}
