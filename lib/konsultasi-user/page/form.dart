import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_summary.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

var data = <Map>[];

class KonsultasiForm extends StatefulWidget {
  const KonsultasiForm({super.key});

  @override
  State<KonsultasiForm> createState() => _KonsultasiFormState();
}

class _Konsultasi {
  String name = "";
  String title = "";
  String description = "";
  String date = "";
  String contactable = "";
  _Konsultasi(this.name, this.title, this.description, this.date, this.contactable);
}

class _KonsultasiFormState extends State<KonsultasiForm> {
  final _formKey = GlobalKey<FormState>();
  String _date = "";
  String _name = "";
  String _title = "";
  String _description = "";
  String _contactable = "";

  bool _yes = false;
  bool _no = false;

  List<String> program = ["YES", "NO"];
  int index = -1;



  createKonsultasi(request, konsultasi) async{
    final response = await request.post(
      'https://web-production-c284.up.railway.app/curhat/add-konsultasi-flutter', {
      'name': konsultasi.name,
      'date': konsultasi.date,
      'title': konsultasi.title,
      'description': konsultasi.description,
      'contactable': konsultasi.contactable,
    });
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const KonsultasiSummary()),
    );
  }

  static const primaryColor = Color(0xFF548AFF);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    index = _yes
        ? 0
        : _no
            ? 1
            : -1;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Fill New Consultation Form'),
          backgroundColor: primaryColor,
          leadingWidth: 64,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const MyHomePage()),
              // );
            },
            icon: Icon(Icons.arrow_back),
            //replace with our own icon data.
          )),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.people),
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.title_rounded),
                      labelText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.chat),
                      labelText: "Description",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Description can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: Icon(Icons.email),
                        title: Text(
                            "Do you need consultation in interactive mode?"),
                      ),
                      CheckboxListTile(
                        title: const Text('YES'),
                        value: _yes,
                        onChanged: (bool? value) {
                          setState(() {
                            _contactable = "Y";
                            _yes = value!;
                            print(_contactable);
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('NO'),
                        value: _no,
                        onChanged: (bool? value) {
                          setState(() {
                            _no = value!;
                            _contactable = "N";
                            print(_contactable);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    height: 48,
                    width: 120,
                    child: TextButton(
                      child: const Text(
                        "Submit",
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
                          final _konsultasi = new _Konsultasi(
                              _name,
                              _date,
                              _title,
                              _description,
                              _contactable);
                          createKonsultasi(request, _konsultasi);
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
