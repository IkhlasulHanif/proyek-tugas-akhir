import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'report_form.dart';

class ReportDetail extends StatefulWidget {
  const ReportDetail({
    super.key,
    required this.user,
    required this.name,
    required this.phoneNum,
    required this.email,
    required this.caseName,
    required this.victimName,
    required this.victimDescription,
    required this.crimePlace,
    required this.chronology,
  });

  final int user;
  final String name;
  final String phoneNum;
  final String email;
  final String caseName;
  final String victimName;
  final String victimDescription;
  final String crimePlace;
  final String chronology;

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
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
            icon: Icon(Icons.arrow_back),
            //replace with our own icon data.
          )),
      // Menambahkan drawer menu
      body: Container(
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
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Text("submitted by " + widget.name),
            Text(widget.phoneNum),
            Text(widget.email),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Text("Victim Detail"),
            Text(widget.victimName),
            Text(widget.victimDescription),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Text("Case Detail:"),
            Text(widget.chronology),
            Text(widget.crimePlace)
          ],
        ),
      ),
    );
  }
}
