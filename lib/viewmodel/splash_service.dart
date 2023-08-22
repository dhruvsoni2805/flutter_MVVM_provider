import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/viewmodel/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      debugPrint(value.token);
      if (value.token == "null" || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RouteName.loginscreen);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RouteName.homescreen);
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
