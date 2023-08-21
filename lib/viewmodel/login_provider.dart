import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/app_url.dart';
import 'package:mvvm_provider/respository/login_repo.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utlis.dart';

class LoginScreenProvider with ChangeNotifier {
  bool _showpassword = false;

  bool get showpassword => _showpassword;

  final _loginfunction = LoginRepo();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    debugPrint(_loading.toString());
    notifyListeners();
  }

  void togglePasswordState() {
    _showpassword = !_showpassword;
    notifyListeners();
  }

  Future<void> loginApi(context, dynamic data) async {
    setLoading(true);
    _loginfunction.loginApi(data).then((value) {
      debugPrint("Login Response from this ${AppUrl.loginUrl} is :  $value");
      setLoading(false);
      Navigator.pushReplacementNamed(context, RouteName.homescreen);
      Utils.toastSuccessMessage("Login Done", context);
    }).onError((error, stackTrace) {
      Utils.toastErrorMessage("User Not Found", context);
      debugPrint("the error is : ${error.toString()}");
      setLoading(false);
    });
  }
}
