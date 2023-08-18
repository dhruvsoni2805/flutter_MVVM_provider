import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_provider/data/exception/app_exception.dart';
import 'package:mvvm_provider/data/network/api_list.dart';

class ApiService extends ApiList {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 60));
      responseJson = returnresponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(Duration(seconds: 60));
      responseJson = returnresponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
  }

  dynamic returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAutoriseException(response.body.toString());
      default:
        throw FetchDataException(
            'Error while communication' + response.statusCode.toString());
    }
  }
}
