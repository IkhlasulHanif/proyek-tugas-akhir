import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/consultation_admin/utils/fetch_consultation.dart';

import 'package:proyek_tugas_akhir/consultation_admin/page/consultation_detail.dart';
import '../../laporan_admin/page/laporan_detail.dart';
import '../../laporan_admin/utils/list_laporan_admin.dart';
import '../../laporan_admin/model/response_model.dart';

class StatusLaporan {
  static List<String> listStatus = [];
}

void getStatus() async{
  List<ResponseLaporan> allResponse = await fetchAllResponse();
  for(var i =0; i < allResponse.length; i ++){
    String value = allResponse[i].fields.statusCase;
    if(value == "null") StatusLaporan.listStatus.add("Waiting");
    if(value == "true") StatusLaporan.listStatus.add("On Process");
    if(value == "false") StatusLaporan.listStatus.add("Rejected");
  }
}

void main() {
  getStatus();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const AdminPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;
  static const primaryColor = Color(0xFF548AFF);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 100,
          height: 40,
          child: Image.asset(
            'assets/logo_tes.png',
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
            ),
            Center(
                child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Speak Up',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Now',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 24)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Speak Up Now merupakan portal informasi dan pelaporan pelecehan seksual dalam lingkungan Universitas Indonesia.'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/ui.png',
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Universitas Indonesia',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Bekerja sama dengan Universitas Indonesia untuk membangun kampus sebagai ruang aman.',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/konsul.png',
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Konsultasi',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Memberikan layanan terbaik untuk para penyintas memahami kondisinya.',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/lapor.png',
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Laporan',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Menjadi teman pertama para penyintas untuk mendapatkan keadilan.',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                ),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset(
                    'assets/g20.png',
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Mendukung G20',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Kasus kekerasan seksual terhadap perempuan dan anak akan berdampak pada perekonomian negara dan hilangnya masa pendidikan anak sebagai penerus bangsa ke depan. Indonesia bisa mendorong perlindungan perempuan di G-20.',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Summary'),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder(
          future: fetchConsultation(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum ada konsultasi dari user!",
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
                                    builder: (context) => ConsultationDetail(
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
                                          pk: snapshot.data![index].pk,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 9),
                            padding: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(
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
                                    GestureDetector(
                                      onTap: () {
                                        snapshot.data![index] =
                                            deleteConsultation(snapshot
                                                .data![index].pk
                                                .toString());
                                      },
                                      child: Container(
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
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                        ),
                                        child: const Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
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
    ),
    // const Text(
    //   'Index 2: School',
    // ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Report Summary'),
        backgroundColor: primaryColor,
      ),
      // Menambahkan drawer menu
      // drawer: DrawerClass(parentScreen: ScreenName.MyWatchList),
      body: FutureBuilder(
          future: fetchLaporan(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "No report from user!",
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
                                    Text( 
                                        "${snapshot.data![index].fields.caseName}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
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
                                    // Text( // Status
                                    //     StatusLaporan.listStatus[index],
                                    //     style: const TextStyle(
                                    //       fontSize: 16.0,
                                    //     )),
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
                                      child: 
                                      Text(
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Konsultasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crisis_alert),
            label: 'Lapor',
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 20,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 25),
        selectedItemColor: primaryColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped, //New
      ),
    );
  }
}
