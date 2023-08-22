import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_provider/data/exception/app_exception.dart';
import 'package:mvvm_provider/data/network/base_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      debugPrint("the url is : ${url.toString()}");
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
      debugPrint("the Data response is : ${response.body.toString()}");
      debugPrint("6786531");
      print("the Data response is : ${response.body.toString()}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      debugPrint("the url is : ${url.toString()}");
      debugPrint("the data is : ${data.toString()}");
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      debugPrint(" response is : ${response.body}");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        print("vybuk");
        // dynamic responseJson = jsonDecode(response.body);
        // return responseJson;
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnAutoriseException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server with status code ${response.statusCode}');
    }
  }
}
