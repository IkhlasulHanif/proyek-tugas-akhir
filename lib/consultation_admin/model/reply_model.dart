// To parse this JSON data, do
//
//     final reply = replyFromJson(jsonString);

import 'dart:convert';

List<Reply> replyFromJson(String str) =>
    List<Reply>.from(json.decode(str).map((x) => Reply.fromJson(x)));

String replyToJson(List<Reply> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reply {
  Reply({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
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
    required this.curhatUser,
    required this.adminName,
    required this.date,
    required this.title,
    required this.description,
  });

  dynamic curhatUser;
  String adminName;
  DateTime date;
  String title;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        curhatUser: json["curhat_user"],
        adminName: json["admin_name"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "curhat_user": curhatUser,
        "admin_name": adminName,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "title": title,
        "description": description,
      };
}
