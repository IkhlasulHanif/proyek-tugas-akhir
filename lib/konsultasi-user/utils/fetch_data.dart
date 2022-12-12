import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/konsultasi-user/model/konsultasi_model.dart';
import 'package:proyek_tugas_akhir/consultation_admin/model/reply_model.dart';


Future<List<Konsultasi>> fetchKonsultasi(request) async {
  final response = await request
      .get('https://web-production-c284.up.railway.app/curhat/json/');
  print(response);

  List<Konsultasi> listKonsultasi = [];
  for (var d in response) {
    if (d != null) {
      print(Konsultasi.fromJson(d).fields.name);
      listKonsultasi.add(Konsultasi.fromJson(d));
      print("");
      print(listKonsultasi);
    }
  }

  return listKonsultasi;
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

// Future<http.Response> deleteConsultation(String id) async {
//   final http.Response response = await http.delete(
//     Uri.parse(
//         'https://web-production-c284.up.railway.app/curhat-admin/delete-json-flutter/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );

//   return response;
// }
