// To parse this JSON data, do
//
//     final laporan = laporanFromJson(jsonString);

import 'dart:convert';

List<Laporan> laporanFromJson(String str) => List<Laporan>.from(json.decode(str).map((x) => Laporan.fromJson(x)));

String laporanToJson(List<Laporan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Laporan {
    Laporan({
        required this.pk,
        required this.fields,
    });

    int pk;
    Fields fields;

    factory Laporan.fromJson(Map<String, dynamic> json) => Laporan(
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
        required this.name,
        required this.phoneNum,
        required this.email,
        required this.caseName,
        required this.victimName,
        required this.victimDescription,
        required this.crimePlace,
        required this.chronology,
    });

    int user;
    String name;
    String phoneNum;
    String email;
    String caseName;
    String victimName;
    String victimDescription;
    String crimePlace;
    String chronology;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        phoneNum: json["phone_num"],
        email: json["email"],
        caseName: json["case_name"],
        victimName: json["victim_name"],
        victimDescription: json["victim_description"],
        crimePlace: json["crime_place"],
        chronology: json["chronology"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "phone_num": phoneNum,
        "email": email,
        "case_name": caseName,
        "victim_name": victimName,
        "victim_description": victimDescription,
        "crime_place": crimePlace,
        "chronology": chronology,
    };
}
