import 'package:flutter/cupertino.dart';
import 'package:proyek_tugas_akhir/home & login/model/loginpage-model.dart';

class UserManagement with ChangeNotifier {
  UserLogin? _userLogin;

  void setUser(UserLogin u) {
    _userLogin = u;
    notifyListeners();
  }

  void removeUser() {
    _userLogin = null;
    notifyListeners();
  }

  UserLogin? get userloggedin => _userLogin;
}
