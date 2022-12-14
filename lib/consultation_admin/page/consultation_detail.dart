import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/consultation_admin/utils/fetch_consultation.dart';

import 'consultation_reply_form.dart';

class ConsultationDetail extends StatefulWidget {
  const ConsultationDetail({
    super.key,
    required this.title,
    required this.user,
    required this.date,
    required this.name,
    required this.description,
    required this.pk,
  });

  final String title;
  final int user;
  final DateTime date;
  final String name;
  final String description;
  final int pk;

  @override
  State<ConsultationDetail> createState() => _ConsultationDetailState();
}

class _ConsultationDetailState extends State<ConsultationDetail> {
  static const primaryColor = Color(0xFF548AFF);

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
              icon: const Icon(Icons.arrow_back),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      DateFormat.yMMMMd().format(widget.date),
                    ),
                  ),
                  Text(widget.name),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(children: [
                      Flexible(
                        child: Text(widget.description),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              color: primaryColor,
              width: double.infinity,
              height: 1,
            ),
            FutureBuilder(
                future: fetchReply(widget.pk),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    // print('kosong');
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.data.length == 0) {
                      // print('0');
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
                      // print('asdfasdfasdf');
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reply dari Admin ${snapshot.data![0].fields.adminName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                            ),
                            Text(
                              "${snapshot.data![0].fields.title}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            Text("${snapshot.data![0].fields.description}")
                          ],
                        ),
                      );
                    }
                  }
                }),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConsultationReplyForm(pk: widget.pk)),
              ).then((_) => setState(() {}));
            },
            child: const Icon(Icons.reply_rounded),
          ),
        ));
  }
}
