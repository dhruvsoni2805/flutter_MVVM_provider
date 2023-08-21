import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/app_url.dart';

import '../respository/register_repo.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utlis.dart';

class RegisterScreenProvider with ChangeNotifier {
  bool _showpassword = false;

  bool get showpassword => _showpassword;

  final _registerfunction = RegisterRepo();

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

  Future<void> registerUser(context, dynamic data) async {
    setLoading(true);
    _registerfunction.registerApi(data).then((value) {
      debugPrint(
          "Register Response from this ${AppUrl.registerurl} is :  $value");
      setLoading(false);
      Navigator.pushReplacementNamed(context, RouteName.loginscreen);
      Utils.toastSuccessMessage("register Done", context);
    }).onError((error, stackTrace) {
      Utils.toastErrorMessage(
          "Only Defined Users Succeed Registration", context);
      debugPrint("the error is : ${error.toString()}");
      setLoading(false);
    });
  }
}
