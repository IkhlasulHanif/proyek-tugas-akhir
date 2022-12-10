import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/konsultasi-user/model/konsultasi_model.dart';

Future<List<Konsultasi>> fetchConsultation() async {
  var url =
      Uri.parse('https://web-production-c284.up.railway.app/curhat/json');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Konsultasi> listConsultation = [];
  for (var d in data) {
    if (d != null) {
      listConsultation.add(Konsultasi.fromJson(d));
    }
  }

  return listConsultation;
}