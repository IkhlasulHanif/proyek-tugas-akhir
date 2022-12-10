import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/fetch/fetch_data.dart';
import 'konsultasi-user/page/form.dart';
import 'konsultasi-user/page/konsultasi_detail.dart';
import 'home & login/page/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter App'),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  static const primaryColor = Color(0xFF2D55D0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: primaryColor,
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Buat Konsultasi'),
        backgroundColor: primaryColor,
      ),
    ),
    const Text(
      'Index 2: School',
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
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).pushNamed("/login");
        }),
      ),
    );
  }
}
