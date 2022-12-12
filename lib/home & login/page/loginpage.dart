import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_tugas_akhir/admin/page/admin_page.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/model/loginpage-model.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/util/user_provider.dart';
import 'package:proyek_tugas_akhir/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyek_tugas_akhir/report_user/page/report_summary.dart';
import 'package:proyek_tugas_akhir/user/page/user_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final user = context.watch<UserManagement>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Color(0xFF548AFF),
        ),
        body: Form(
            key: _loginFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      try {
                        final response = await request.login(
                            "https://web-production-c284.up.railway.app/user-details/",
                            {
                              'username': username,
                              'password': password1,
                            });
                        if (request.loggedIn) {
                          var loginuser = UserLogin.fromJson(response["data"]);
                          user.setUser(loginuser);
                          print(loginuser.username);
                          print(loginuser.is_konsulir);
                          if (loginuser.is_konsulir) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const AdminPage(
                                          title: '',
                                        ))));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const UserPage(
                                          title: '',
                                        ))));
                          }
                        }
                      } catch (_) {
                        print("error");
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            )));
  }
}
