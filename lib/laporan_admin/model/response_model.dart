// To parse this JSON data, do
//
//     final responseLaporan = responseLaporanFromJson(jsonString);

import 'dart:convert';

List<ResponseLaporan> responseLaporanFromJson(String str) => List<ResponseLaporan>.from(json.decode(str).map((x) => ResponseLaporan.fromJson(x)));

String responseLaporanToJson(List<ResponseLaporan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseLaporan {
    ResponseLaporan({
        required this.pk,
        required this.fields,
    });

    int pk;
    Fields fields;

    factory ResponseLaporan.fromJson(Map<String, dynamic> json) => ResponseLaporan(
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
        required this.laporanUser,
        required this.adminName,
        required this.caseName,
        required this.statusCase,
        required this.adminResponse,
    });

    int laporanUser;
    String adminName;
    String caseName;
    String statusCase;
    String adminResponse;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        laporanUser: json["laporan_user"],
        adminName: json["admin_name"],
        caseName: json["case_name"],
        statusCase: json["status_case"].toString(),
        adminResponse: json["admin_response"],
    );

    Map<String, dynamic> toJson() => {
        "laporan_user": laporanUser,
        "admin_name": adminName,
        "case_name": caseName,
        "status_case": statusCase,
        "admin_response": adminResponse,
    };
}