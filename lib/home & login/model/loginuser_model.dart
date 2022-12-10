import 'dart:convert';

List<UserLogin> consultationFromJson(String str) =>
    List<UserLogin>.from(json.decode(str).map((x) => UserLogin.fromJson(x)));

String consultationToJson(List<UserLogin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLogin {
  UserLogin({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.username,
    required this.password,
    required this.is_konsulir,
  });

  String username;
  String password;
  bool is_konsulir;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        username: json["username"],
        password: json["password"],
        is_konsulir: json["is_konsulir"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "is_konsulir": is_konsulir,
      };
}
