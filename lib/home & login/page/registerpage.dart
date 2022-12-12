import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/main.dart';
import 'dart:convert' as convert;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _RegisterFormKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  dynamic _validationPassword;
  dynamic _validationUsername;

  Future<dynamic> PasswordValidator(PasswordValidator) async {
    _validationPassword = null;

    if (PasswordValidator.isEmpty) {
      _validationPassword = "Konfirmasi password tidak boleh kosong";
      setState(() {});
      return;
    }

    if (PasswordValidator != password1) {
      _validationPassword = "Password tidak sama";
      setState(() {});
      return;
    }
    setState(() {
      password2 = PasswordValidator;
    });
  }

  Future<dynamic> UsernameValidator(UsernameValidator) async {
    _validationUsername = null;

    if (UsernameValidator.isEmpty) {
      _validationUsername = "Username tidak boleh kosong";
      setState(() {});
      return;
    }
    setState(() {});
    final response = await CookieRequest().get(
        "https://web-production-c284.up.railway.app/register/validate-username?username=$UsernameValidator");
    bool exists = response["is_taken"];
    if (exists) {
      _validationUsername = "Username is Taken";
      setState(() {});
      return;
    } else {
      setState(() {
        username = UsernameValidator;
      });
    }
  }

  String username = "";
  String password1 = "";
  String password2 = "";
  bool is_konsulir = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _RegisterFormKey,
        child: Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                  title: const Text('Registration Form'),
                ),
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Focus(
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your username",
                                  labelText: 'Username',
                                  icon: const Icon(Icons.people),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                controller: _usernameCtrl,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => _validationUsername),
                            onFocusChange: (hasFocus) {
                              if (!hasFocus)
                                UsernameValidator(_usernameCtrl.toString());
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Focus(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  labelText: 'Password',
                                  icon: const Icon(Icons.lock_person_rounded),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Focus(
                            child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText:
                                        'Enter your password confirmation',
                                    labelText: 'Password Confirmation',
                                    icon:
                                        const Icon(Icons.lock_person_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                controller: _passwordCtrl,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  _validationPassword = value;
                                }),
                            onFocusChange: (hasFocus) {
                              if (!hasFocus)
                                PasswordValidator(
                                    _validationPassword.toString());
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Focus(
                              child: CheckboxListTile(
                            value: is_konsulir,
                            onChanged: (bool? checkbox) {
                              setState(() {
                                is_konsulir = checkbox!;
                              });
                            },
                            title: Text('Staff'),
                          )),
                        ),
                        Container(
                          height: size.height * 0.08,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_RegisterFormKey.currentState!.validate()) {
                                final response = await request.postJson(
                                    'https://web-production-c284.up.railway.app/register-ajax/',
                                    convert.jsonEncode({
                                      'username': username,
                                      'password1': password1,
                                      'password2': password2,
                                      'is_konsulir': is_konsulir
                                    }));
                                if (response['status'] == true) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Account Has Been Successfully Registered!"),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "An Error Occured, Please Try Again"),
                                  ));
                                }
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        )
                      ],
                    )
                  ],
                )))
          ],
        ));
  }
}
