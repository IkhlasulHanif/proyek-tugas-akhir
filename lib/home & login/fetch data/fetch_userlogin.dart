import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/home & login/model/loginuser_model.dart';

Future<List<UserLogin>> fetchConsultation() async {
  var url =
      Uri.parse('https://web-production-c284.up.railway.app/user-details/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<UserLogin> userlist = [];
  for (var d in data) {
    if (d != null) {
      userlist.add(UserLogin.fromJson(d));
    }
  }

  return userlist;
}
