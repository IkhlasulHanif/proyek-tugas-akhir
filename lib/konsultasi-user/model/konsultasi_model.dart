// To parse this JSON data, do
//
//     final consultation = consultationFromJson(jsonString);

import 'dart:convert';

List<Konsultasi> konsultasiFromJson(String str) => List<Konsultasi>.from(json.decode(str).map((x) => Konsultasi.fromJson(x)));

String konsultasiToJson(List<Konsultasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Konsultasi {
  Konsultasi({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Konsultasi.fromJson(Map<String, dynamic> json) => Konsultasi(
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
    required this.user,
    required this.date,
    required this.name,
    required this.title,
    required this.description,
    required this.contactable,
  });

  int user;
  DateTime date;
  String name;
  String title;
  String description;
  String contactable;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        title: json["title"],
        description: json["description"],
        contactable: json["contactable"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "title": title,
        "description": description,
        "contactable": contactable,
      };
}
