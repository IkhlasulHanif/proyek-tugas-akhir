import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_tugas_akhir/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:proyek_tugas_akhir/report_user/page/report_summary.dart';
import 'package:proyek_tugas_akhir/user/page/user_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/login';

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
    return Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
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
                        await request.login(
                            "https://web-production-c284.up.railway.app/user-details/",
                            {
                              'username': username,
                              'password': password1,
                            });
                        if (request.loggedIn) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const ReportSummary())));
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
