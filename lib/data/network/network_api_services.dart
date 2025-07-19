import 'dart:convert';
import 'dart:io';

import 'package:app_using_getx/data/app_exception.dart';
import 'package:app_using_getx/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("Check Your Internet");
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    return responseJson;
  }

  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    try {
      print(url);
      print("-------------------------------");
      print(jsonEncode(data));
      print('fadkfdjaklfjdkaljfdklasjf');
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("check your internet connection");
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    return responseJson;
  }

  Future<dynamic> deleteApi(var data, String url) async {
    dynamic jsonResponse;
    try {
      print('---------------${jsonEncode(data)}');
      final response = await http
          .post(body: data, Uri.parse(url))
          .timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException('check your internet connection');
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 404:
        throw InvalidUrl("Invalid Url");

      default:
        throw FailedToFetch(response.statusCode.toString());
    }
  }
}
