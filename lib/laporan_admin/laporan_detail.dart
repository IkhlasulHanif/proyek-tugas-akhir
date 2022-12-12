import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:proyek_tugas_akhir/laporan_admin/list_laporan_admin.dart';
import 'laporan_reply_form.dart';

class LaporanDetail extends StatefulWidget {
  const LaporanDetail({
    super.key,
    required this.name,
    required this.phoneNum,
    required this.email,
    required this.caseName,
    required this.victimName,
    required this.victimDescription,
    required this.crimePlace,
    required this.chronology,
    required this.pk,
  });

  final String name;
  final String phoneNum;
  final String email;
  final String caseName;
  final String victimName;
  final String victimDescription;
  final String crimePlace;
  final String chronology;
  final int pk;

  @override
  State<LaporanDetail> createState() => _LaporanDetailState();
}

class _LaporanDetailState extends State<LaporanDetail> {
  static const primaryColor = Color(0xFF2D55D0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(''),
            backgroundColor: primaryColor,
            leadingWidth: 64,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              //replace with our own icon data.
            )),
        // Menambahkan drawer menu
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.caseName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.crimePlace,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.phoneNum,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.email,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.victimName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(children: [
                    Flexible(
                      child: Text(widget.victimDescription),
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(children: [
                    Flexible(
                      child: Text(widget.chronology),
                    )
                  ]),
                ),
              ],
            )
            ),
            Container(
              color: primaryColor,
              width: double.infinity,
              height: 1,
            ),
            FutureBuilder(
                  future: fetchResponse(widget.pk),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.data.length == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: const [
                              Text(
                                "Belum ada reply dari Admin!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reply dari Admin ${snapshot.data![0].fields.adminName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Container(
                                padding: EdgeInsets.all(7),
                              ),
                              
                              if (snapshot.data![0].fields.statusCase == "true") 
                                Text(
                                "On Process",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                                  ),
                              if (snapshot.data![0].fields.statusCase == "false")
                                Text(
                                "Rejected",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                              if (snapshot.data![0].fields.statusCase == "null")
                                Text(
                                "Waiting",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                              Text("${snapshot.data![0].fields.adminResponse}")
                            ],
                          ),
                        );
                      }
                    }
                  }),
          ]
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LaporanReplyForm(pk: widget.pk)),
              );
            },
            child: const Icon(Icons.reply_rounded),
          ),
        ));
  }
}
