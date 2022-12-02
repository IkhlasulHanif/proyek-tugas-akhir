import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/consultation_admin/model/consultation_model.dart';

Future<List<Consultation>> fetchConsultation() async {
  var url = Uri.parse('https://speak-up-now.herokuapp.com/curhat-admin/json');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Consultation> listConsultation = [];
  for (var d in data) {
    if (d != null) {
      listConsultation.add(Consultation.fromJson(d));
    }
  }

  return listConsultation;
}
