import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_detail.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/model/konsultasi_model.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/utils/fetch_data.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:proyek_tugas_akhir/user/page/drawer.dart';
import 'form.dart';

class KonsultasiSummary extends StatefulWidget {
  const KonsultasiSummary({super.key});

  @override
  State<KonsultasiSummary> createState() => _KonsultasiSummaryState();
}

class _KonsultasiSummaryState extends State<KonsultasiSummary> {
  late Future<List<Konsultasi>> futureData;

  static const primaryColor = Color(0xFF548AFF);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Consultation Summary'),
          backgroundColor: primaryColor,
        ),
        drawer: DrawerWidget(),
        // Menambahkan drawer menu
        // drawer: DrawerClass(parentScreen: ScreenName.MyWatchList),
        body: FutureBuilder(
            future: fetchKonsultasi(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "No consultation from user!",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                                            name: snapshot
                                                .data![index].fields.name,
                                            user: snapshot
                                                .data![index].fields.user,
                                            title: snapshot
                                                .data![index].fields.title,
                                            description: snapshot
                                                .data![index].fields.description,
                                            date: snapshot
                                                .data![index].fields.date,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${snapshot.data![index].fields.name}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      // Text(
                                      //     "${snapshot.data![index].fields.victim_name}",
                                      //     style: const TextStyle(
                                      //       fontSize: 16.0,
                                      //     )),
                                      // Text(
                                      //     "${snapshot.data![index].fields.crime_place}",
                                      //     style: const TextStyle(
                                      //       fontSize: 16.0,
                                      //     )),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
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
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KonsultasiForm()),
              ).then((_) => setState(() {}));
            },
            child: const Icon(Icons.reply_rounded),
          ),
        ));
  }
}
