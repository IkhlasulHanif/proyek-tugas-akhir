import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/report_user/model/report_model.dart';

Future<List<Report>> fetchReport() async {
  var url =
      Uri.parse('https://web-production-c284.up.railway.app/laporan/json/');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Report> listReport = [];
  for (var d in data) {
    if (d != null) {
      listReport.add(Report.fromJson(d));
    }
  }

  return listReport;
}
