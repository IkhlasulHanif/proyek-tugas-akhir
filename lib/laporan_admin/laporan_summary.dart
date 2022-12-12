import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/laporan_admin/laporan_model.dart';
import 'package:proyek_tugas_akhir/laporan_admin/laporan_detail.dart';
import 'package:proyek_tugas_akhir/laporan_admin/list_laporan_admin.dart';

import '../admin/page/admin_page.dart';

class LaporanSummary extends StatefulWidget {
  const LaporanSummary({super.key});

  @override
  State<LaporanSummary> createState() => _LaporanSummaryState();
}

class _LaporanSummaryState extends State<LaporanSummary> {
  late Future<List<Laporan>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchLaporan();
  }

  static const primaryColor = Color(0xFF2D55D0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Summary'),
        backgroundColor: primaryColor,
      ),
      // Menambahkan drawer menu
      // drawer: DrawerClass(parentScreen: ScreenName.MyWatchList),
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
                      "No Laporan from user!",
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
                                    builder: (context) => LaporanDetail(
                                          pk: snapshot.data![index].pk,
                                          name:
                                              snapshot.data![index].fields.name,
                                          phoneNum:
                                              snapshot.data![index].fields.phoneNum,
                                          email:
                                              snapshot.data![index].fields.email,
                                          caseName:
                                              snapshot.data![index].fields.caseName,
                                          victimName:
                                              snapshot.data![index].fields.victimName,
                                          victimDescription:
                                              snapshot.data![index].fields.victimDescription,
                                          crimePlace:
                                              snapshot.data![index].fields.crimePlace,
                                          chronology:
                                              snapshot.data![index].fields.chronology,
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
                                    Text("${snapshot.data![index].fields.caseName}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        )),
                                    Text("${snapshot.data![index].fields.crimePlace}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        )),
                                    if (snapshot.data![index].fields.chronology
                                            .length >
                                        20)
                                      Text(
                                          "${snapshot.data![index].fields.chronology.substring(0, 20)}...",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          )),
                                    if (snapshot.data![index].fields.chronology
                                            .length <=
                                        20)
                                      Text(
                                          "${snapshot.data![index].fields.chronology}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          )),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text( // Status
                                        StatusLaporan.listStatus[index],
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