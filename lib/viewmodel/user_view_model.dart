import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', user.token.toString());
    // pref.setString('username', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    // pref.setString('token', user.token.toString());
    // pref.setString('username', user.token.toString());
    notifyListeners();
    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    return true;
  }
}
