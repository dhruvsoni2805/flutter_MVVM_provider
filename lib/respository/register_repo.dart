import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/network/network_service.dart';

import '../data/response/app_url.dart';

class RegisterRepo {
  final _apiService = NetworkApiService();

  Future<dynamic> registerApi(dynamic data) async {
    debugPrint("dynamic data is : ${data.toString()}");
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerurl, data);
      debugPrint("register api");
      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
