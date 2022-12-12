import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_detail.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_summary.dart';
import 'package:proyek_tugas_akhir/main.dart';

var data = <Map>[];

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _title = "";
  String _description = "";
  bool _yes = false;
  bool _no = false;

  List<String> program = ["YES", "NO"];
  int index = -1;

  static const primaryColor = Color(0xFF2D55D0);

  @override
  Widget build(BuildContext context) {
    index = _yes
        ? 0
        : _no
            ? 1
            : -1;
    return Scaffold(
      appBar: AppBar(
          title: Text('Fill New Consultation Form'),
          backgroundColor: primaryColor,
          // automaticallyImplyLeading: false,
          // leadingWidth: 100,
          // leading: ElevatedButton.icon(
          //   onPressed: () => Navigator.of(context).pop(),
          //   icon: const Icon(Icons.arrow_back),
          //   label: Text(''),
          //   style: ElevatedButton.styleFrom(
          //     elevation: 0,
          //     backgroundColor: Colors.transparent,
          //   ),
          // ),
          leadingWidth: 64,
          leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
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
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.people),
                      labelText: "Name",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name can\'t be empty!';
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
                      icon: Icon(Icons.title_rounded),
                      labelText: "Title",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
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
                        return 'Title can\'t be empty!';
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
                            _yes = value!;
                            if (value) {
                              _no = false;
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('NO'),
                        value: _no,
                        onChanged: (bool? value) {
                          setState(() {
                            _no = value!;
                            if (value) {
                              _yes = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
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
                          var map = {};
                          map['name'] = _name;
                          map['title'] = _title;
                          map['description'] = _description;
                          map['interactive'] = program[index];
                          data.add(map);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil disimpan!'),
                              backgroundColor: Colors.green,
                            ),
                          );
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
