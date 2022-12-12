import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        home: const MyHomePage(title: 'Flutter App'),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
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
    const Text(
      'Home',
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Summary'),
        backgroundColor: primaryColor,
      ),
      // Menambahkan drawer menu
      // drawer: DrawerClass(parentScreen: ScreenName.MyWatchList),
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
                      "You haven't fill any consultation form",
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
    ),
    const Text(
      'Index 2: School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      floatingActionButton: SpeedDial(
        child: const Icon(Icons.add),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.insert_comment),
            label: "Consultation",
            backgroundColor: primaryColor,
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.description),
            backgroundColor: primaryColor,
            label: "Report",
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.login_rounded),
            label: "Login",
            backgroundColor: primaryColor,
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.app_registration_rounded),
            label: "Register",
            backgroundColor: primaryColor,
            onTap: () {
              Navigator.of(context).pushNamed('/register');
            },
          )
        ],
      ),
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
