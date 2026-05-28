class Session {
  String url;
  String successUrl;
  String cancelUrl;

  Session({ 
  required  this.url,
  required   this.successUrl,
  required    this.cancelUrl});

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    url: json['url'] as String,
    successUrl: json['success_url'] as String,
    cancelUrl: json['cancel_url'] as String,
  );
}
