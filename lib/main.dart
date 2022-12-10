import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek_tugas_akhir/consultation_admin/utils/fetch_consultation.dart';

import 'consultation_admin/page/consultation_detail.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
                                        "${snapshot.data![index].fields.title}" +
                                            "${snapshot.data![index].pk}",
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
