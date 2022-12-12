import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/laporan_admin/laporan_model.dart';
import 'package:proyek_tugas_akhir/laporan_admin/response_model.dart';

Future<List<Laporan>> fetchLaporan() async {
  var url =
      Uri.parse(
        // 'https://web-production-c284.up.railway.app/laporan-admin/json/'
        'http://localhost:8000/laporan-admin/json'
        );
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Laporan> listLaporan = [];
  for (var d in data) {
    if (d != null) {
      listLaporan.add(Laporan.fromJson(d));
    }
  }

  return listLaporan;
}

Future<List<ResponseLaporan>> fetchAllResponse() async {
  var url =
      Uri.parse(
        // 'https://web-production-c284.up.railway.app/laporan-admin/response/json/'
        'http://localhost:8000/laporan-admin/response/json'
        );
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<ResponseLaporan> listAllResponse = [];
  for (var d in data) {
    if (d != null) {
      listAllResponse.add(ResponseLaporan.fromJson(d));
    }
  }

  return listAllResponse;
}

Future<List<ResponseLaporan>> fetchResponse(int id) async {
  var url = Uri.parse(
      // 'https://web-production-c284.up.railway.app/laporan-admin/response/$id'
      'http://localhost:8000/laporan-admin/response/$id'
      );
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<ResponseLaporan> listResponse = [];
  for (var d in data) {
    if (d != null) {
      listResponse.add(ResponseLaporan.fromJson(d));
    }
  }
  return listResponse;
}

Future<http.Response> deleteLaporan(String id) async {
  final http.Response response = await http.delete(
    Uri.parse(
        // 'https://web-production-c284.up.railway.app/laporan-admin/delete/$id'
        'http://localhost:8000/laporan-admin/delete/$id'
        ),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}