import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/consultation_admin/model/consultation_model.dart';
import 'package:proyek_tugas_akhir/consultation_admin/model/reply_model.dart';

Future<List<Consultation>> fetchConsultation() async {
  var url = Uri.parse('https://web-production-c284.up.railway.app/curhat/json');
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

Future<List<Reply>> fetchReply(int id) async {
  var url = Uri.parse(
      'https://web-production-c284.up.railway.app/curhat-admin/reply-json/$id');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Reply> listReply = [];
  for (var d in data) {
    if (d != null) {
      listReply.add(Reply.fromJson(d));
    }
  }
  return listReply;
}

Future<http.Response> deleteConsultation(String id) async {
  final http.Response response = await http.delete(
    Uri.parse(
        'https://web-production-c284.up.railway.app/curhat-admin/delete-json-flutter/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
