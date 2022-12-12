import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/page/loginpage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/page/registerpage.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/util/user_provider.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/fetch/fetch_data.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/form.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_detail.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'konsultasi-user/page/konsultasi_detail.dart';
import 'konsultasi-user/fetch/fetch_data.dart';
import 'home & login/page/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/home';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
        ),
        ChangeNotifierProvider(create: (_) => UserManagement())
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: const Icon(Icons.reply_rounded),
          )),
    );
  }
}
