import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/report_user/model/report_model.dart';

Future<List<Report>> fetchReport(request) async {
  final response = await request
      .get('https://web-production-c284.up.railway.app/laporan/json/');
  print(response);

  List<Report> listReport = [];
  for (var d in response) {
    if (d != null) {
      print(Report.fromJson(d).fields.name);
      listReport.add(Report.fromJson(d));
      print("");
      print(listReport);
    }
  }

  return listReport;
}
