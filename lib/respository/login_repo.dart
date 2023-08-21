import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/network/base_service.dart';
import 'package:mvvm_provider/data/network/network_service.dart';
import 'package:mvvm_provider/data/response/app_url.dart';

class LoginRepo with ChangeNotifier {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    debugPrint("dynamic data is : ${data.toString()}");
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
