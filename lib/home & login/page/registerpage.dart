import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const ROOUTE_NAME = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _RegisterFormKey = GlobalKey<FormState>();

  String username = "";
  String password1 = "";
  String password2 = "";
  bool is_konsulir = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration Form'),
        ),
        body: Form(
          key: _RegisterFormKey,
          child: Column(children: [
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password Confirmation',
                    hintText: 'Enter your password confirmation',
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
                    return 'Konfirmasi password tidak boleh kosong!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CheckboxListTile(
                title: const Text('Staff'),
                value: is_konsulir,
                onChanged: (bool? value) {
                  setState(() {
                    is_konsulir = value!;
                  });
                },
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_RegisterFormKey.currentState!.validate()) {
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
                              builder: ((context) => const MyApp())));
                    }
                  } catch (_) {
                    print("error");
                  }
                }
              },
              child: const Text('Login'),
            ),
          ]),
        ));
  }
}
