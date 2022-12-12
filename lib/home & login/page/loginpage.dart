import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_tugas_akhir/admin/page/admin_page.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/model/loginpage-model.dart';
import 'package:proyek_tugas_akhir/home%20&%20login/page/registerpage.dart';
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

  bool isPasswordVisible = true;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final user = context.watch<UserManagement>();
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/logo_tes.png',
                        width: MediaQuery.of(context).size.width / 2.5),
                  ),
                  Form(
                      key: _loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  icon: const Icon(Icons.person),
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
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
                              obscureText: isPasswordVisible,
                              decoration: InputDecoration(
                                  icon: const Icon(Icons.lock_person_outlined),
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: InkWell(
                                      onTap: togglePasswordView,
                                      child: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  )),
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
                          ElevatedButton(
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
                                    var loginuser =
                                        UserLogin.fromJson(response["data"]);
                                    user.setUser(loginuser);
                                    print(loginuser.username);
                                    print(loginuser.is_konsulir);
                                    if (loginuser.is_konsulir)
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const AdminPage(
                                                    title: '',
                                                  ))));
                                    else
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const UserPage(
                                                    title: '',
                                                  ))));
                                  }
                                } catch (_) {
                                  print("error");
                                }
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Belum mempunyai akun?'),
                      TextButton(
                        child: const Text(
                          'Daftar Di sini',
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
