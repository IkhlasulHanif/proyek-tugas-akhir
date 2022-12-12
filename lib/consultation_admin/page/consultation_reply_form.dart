import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultationReplyForm extends StatefulWidget {
  const ConsultationReplyForm({
    super.key,
    required this.pk,
  });

  final int pk;

  @override
  State<ConsultationReplyForm> createState() => _ConsultationReplyFormState();
}

class _ConsultationReplyFormState extends State<ConsultationReplyForm> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _description = "";

  Future<void> submit(BuildContext context) async {
    final response = await http.post(
        Uri.parse(
            'https://web-production-c284.up.railway.app/curhat-admin/add-reply-flutter'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'title': _title,
          'description': _description,
          'pk': widget.pk,
        }));
  }

  static const primaryColor = Color(0xFF2D55D0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Reply Consultation'),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.title_rounded),
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
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.subject),
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Description can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    height: 48,
                    width: 120,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(16)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          submit(context);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Send Reply",
                        style: TextStyle(color: Colors.white),
                      ),
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
