import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/fetch/fetch_data.dart';
import 'package:proyek_tugas_akhir/report_user/page/report_detail.dart';
import 'package:proyek_tugas_akhir/report_user/utils/fetch_report.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:proyek_tugas_akhir/user/page/drawer.dart';

import '../../konsultasi-user/page/form.dart';
import '../../konsultasi-user/page/konsultasi_detail.dart';
import '../../report_user/page/report_form.dart';

void main() {
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
      home: const UserPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  int _counter = 0;
  int _selectedIndex = 0;
  static const primaryColor = Color(0xFF548AFF);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 100,
          height: 40,
          child: Image.asset(
            'assets/LOGO.png',
          ),
        ),
        backgroundColor: primaryColor,
      ),
      drawer: DrawerWidget(),
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
    );
  }
}
