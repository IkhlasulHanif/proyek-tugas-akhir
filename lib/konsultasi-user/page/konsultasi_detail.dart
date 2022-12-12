import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/form.dart';

class DetailKonsultasi extends StatefulWidget {
  const DetailKonsultasi({
    super.key,
    required this.user,
    required this.title,
    required this.date,
    required this.name,
    required this.description,
  });

  final String title;
  final int user;
  final DateTime date;
  final String name;
  final String description;

  @override
  State<DetailKonsultasi> createState() => _DetailKonsultasiState();
}

class _DetailKonsultasiState extends State<DetailKonsultasi> {
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
                widget.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  DateFormat.yMMMMd().format(widget.date),
                ),
              ),
              Text(widget.name),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(children: [
                  Flexible(
                    child: Text(widget.description),
                  )
                ]),
              ),
            ],
          ),
        ),
        );
  }
}
