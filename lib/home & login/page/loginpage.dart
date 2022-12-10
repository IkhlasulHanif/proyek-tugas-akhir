import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import '../model/loginuser_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _loginFormKey = GlobalKey<FormState>();
//   bool isPasswordVisible = false;
//   void togglePasswordView() {
//     setState(() {
//       isPasswordVisible = !isPasswordVisible;
//     });
//   }

//   String username = "";
//   String password1 = "";
//   @override
//   Widget build(BuildContext context) {
//     final request = context.watch<CookieRequest>();
//     // 'username' and 'password' should be the values of the user login form.
//     final response = request
//         .login("https://web-production-c284.up.railway.app//auth/login", {
//       'username': username,
//       'password': password1,
//     });
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Login Page'),
//         ),
//         body: Form(
//             key: _loginFormKey,
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                           labelText: 'Username',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0)),
//                           hintText: 'Enter your username'),
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0)),
//                           hintText: 'Enter your password'),
//                     )
//                   ],
//                 ),
//               ),
//             )));
//   }
// }
class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    this.username,
    this.password,
    this.is_konsulir,
  });

  final String? username;
  final String? password;
  final bool? is_konsulir;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<List<UserLogin>> fetchuserlist() async {
    var url =
        Uri.parse('https://web-production-c284.up.railway.app/user-details');
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
    });
    print(response);

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<UserLogin> userlist = [];
    for (var d in data) {
      if (d != null) {
        userlist.add(UserLogin.fromJson(d));
      }
    }

    return userlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: const Color(0xFF2D55D0),
          leadingWidth: 64,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          )),
      body: FutureBuilder(
        future: fetchuserlist(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada List User",
                    style: TextStyle(
                      color: Color(0xFF2D55D0),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 2.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: unnecessary_string_interpolations
                        children: [
                          Text(
                            snapshot.data![index].fields.username,
                          ),
                          const SizedBox(height: 10),
                          Text(snapshot.data![index].fields.password)
                        ],
                      ))));
            }
          }
        },
      ),
    );
  }
}
