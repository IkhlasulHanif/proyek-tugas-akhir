import 'dart:convert';

List<UserLogin> loginFromJson(String str) =>
    List<UserLogin>.from(json.decode(str).map((x) => UserLogin.fromJson(x)));

String loginToJson(List<UserLogin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLogin {
  UserLogin({
    required this.username,
    required this.is_konsulir,
  });

  String username;
  bool is_konsulir;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        username: json["username"],
        is_konsulir: json["is_konsulir"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "is_konsulir": is_konsulir,
      };
}
