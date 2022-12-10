import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/consultation_admin/model/consultation_model.dart';
import 'package:proyek_tugas_akhir/consultation_admin/model/reply_model.dart';

Future<dynamic> addReply(Reply reply) async {
  var url = Uri.parse(
      'https://web-production-c284.up.railway.app/curhat-admin/add-reply-flutter');
  var response = await http.post(url,
      headers: {
        "Access-Control_Allow_Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(reply));
  return jsonDecode(response.body)["success"];
}

Future<List<Consultation>> fetchConsultation() async {
  var url =
      Uri.parse('https://web-production-c284.up.railway.app/curhat-admin/json');
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
  // int i = 0;
  List<Reply> listReply = [];
  for (var d in data) {
    if (d != null) {
      listReply.add(Reply.fromJson(d));
    }
    // print(i++);
  }
  return listReply;
}
