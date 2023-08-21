import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/app_url.dart';
import 'package:mvvm_provider/respository/login_repo/login_repo.dart';

import '../utils/routes/utlis.dart';

class LoginScreenProvider with ChangeNotifier {
  bool _showpassword = false;

  bool get showpassword => _showpassword;

  final _loginfunction = LoginRepo();

  void togglePasswordState() {
    _showpassword = !_showpassword;
    notifyListeners();
  }

  Future<void> loginApi(context, dynamic data) async {
    debugPrint("the data is : ${data.toString()}");
    _loginfunction.loginApi(data, context).then((value) {
      debugPrint("Login Response from this ${AppUrl.loginUrl} is :  $value");

      Utils.toastSuccessMessage(value.toString(), context);
    }).onError((error, stackTrace) {
      debugPrint("the error is : ${error.toString()}");
    });
  }
}
