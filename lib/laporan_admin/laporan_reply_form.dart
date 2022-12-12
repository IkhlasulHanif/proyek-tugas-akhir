import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LaporanReplyForm extends StatefulWidget {
  const LaporanReplyForm({
    super.key,
    required this.pk,
  });

  final int pk;

  @override
  State<LaporanReplyForm> createState() => _LaporanReplyFormState();
}

class _LaporanReplyFormState extends State<LaporanReplyForm> {
  final _formKey = GlobalKey<FormState>();
  late int pk;
  List<String> listStatusLaporan = ['Select Status', 'On Process', 'Rejected'];
  String _statusInput = 'Select Status';
  String _statusLaporan = "null"; 
  String _shortMessage = "";

  Future<void> submit(BuildContext context) async {
    final response = await http.post(
        Uri.parse(
            'https://web-production-c284.up.railway.app/laporan-admin/add-response-flutter'
        // 'http://localhost:8000/laporan-admin/add-response-flutter'
        ),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'status_case': _statusLaporan,
          'message': _shortMessage,
          'pk': widget.pk,
        }));
  }

  static const primaryColor = Color(0xFF2D55D0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Reply Laporan'),
          backgroundColor: primaryColor,
          leadingWidth: 64,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Report Status',
                  ),
                  trailing: DropdownButton(
                    value: _statusInput,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listStatusLaporan.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _statusInput = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.subject),
                      labelText: "Short Message",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _shortMessage = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _shortMessage = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.startsWith('0')) {
                        return 'Message can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: SizedBox(
                    height: 48,
                    width: 120,
                    child: TextButton(
                      child: const Text(
                        "Send Response",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(16)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if(_statusInput == "On Process") setState(() {
                            _statusLaporan = "true";
                          });
                          if(_statusInput == "Rejected") setState(() {
                            _statusLaporan = "false";
                          });
                          submit(context);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
