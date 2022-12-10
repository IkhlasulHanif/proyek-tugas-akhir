import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/model/konsultasi_model.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_detail.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/fetch/fetch_data.dart';

class KonsultasiSummary extends StatefulWidget {
  const KonsultasiSummary({super.key});

  @override
  State<KonsultasiSummary> createState() => _KonsultasiSummaryState();
}

class _KonsultasiSummaryState extends State<KonsultasiSummary> {
  late Future<List<Konsultasi>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchConsultation();
  }

  static const primaryColor = Color(0xFF2D55D0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Summary'),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder(
          future: futureData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "No consultation from user!",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailKonsultasi(
                                          title: snapshot
                                              .data![index].fields.title,
                                          user:
                                              snapshot.data![index].fields.user,
                                          date:
                                              snapshot.data![index].fields.date,
                                          name:
                                              snapshot.data![index].fields.name,
                                          description: snapshot
                                              .data![index].fields.description,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 9),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color(0xffA5A5A5),
                                ),
                              ),
                              // borderRadius:
                              // BorderRadius.all(Radius.circular(10))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text("${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        )),
                                    if (snapshot.data![index].fields.description
                                            .length >
                                        20)
                                      Text(
                                          "${snapshot.data![index].fields.description.substring(0, 20)}...",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          )),
                                    if (snapshot.data![index].fields.description
                                            .length <=
                                        20)
                                      Text(
                                          "${snapshot.data![index].fields.description}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          )),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        DateFormat.yMMMMd().format(
                                            snapshot.data![index].fields.date),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 5,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 2.0, color: Colors.red),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        ),
                                      ),
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            
                          ),
                        ));
                        
              }
            }
          }),
    );
  }
}