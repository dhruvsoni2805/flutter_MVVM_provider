import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/network/base_service.dart';
import 'package:mvvm_provider/data/network/network_service.dart';
import 'package:mvvm_provider/data/response/app_url.dart';

class LoginRepo {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data, context) async {
    debugPrint("dynamic data is : ${data.toString()}");
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);

      // debugPrint(response.body);
      return response;
    } catch (e) {
      debugPrint("the error is mine");
      // debugPrint(e.toString());
      // Utils.toastErrorMessage(e.toString(), context);
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerurl, data);

      return response;
    } catch (e) {}
  }
}
