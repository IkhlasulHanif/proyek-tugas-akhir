import 'dart:convert';

List<Konsultasi> konsultasiFromJson(String str) =>
    List<Konsultasi>.from(json.decode(str).map((x) => Konsultasi.fromJson(x)));

String toDoToJson(List<Konsultasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Konsultasi {
  Konsultasi({
    required this.date,
    required this.name,
    required this.title,
    required this.description,
  });

  String date;
  String name;
  String title;
  String description;

  factory Konsultasi.fromJson(Map<String, dynamic> json) => Konsultasi(
        date: json["date"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "name": name,
        "title": title,
        "description": description,
      };
}
