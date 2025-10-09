class AuthResponseModel {
  const AuthResponseModel({required this.token});
  final String? token;

  Map<String, dynamic> toJson() {
    return {"token": token};
  }

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(token: json['token']);
  }
}
