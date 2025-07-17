import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tastebuds/data/networks/base_api_service.dart';
import 'package:tastebuds/data/response/api_exception.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    }
    on SocketException {
    throw InternetException('');
    } 
    on RequestTimeout {
    throw RequestTimeout('');
    }
    return responseJson;
    }

  @override
  Future postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url),
          
           body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No internet');
    } on RequestTimeout {
      throw RequestTimeout('time out');
    } 
    if(kDebugMode){
      print(responseJson);
    }
    print(responseJson);

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        // throw InvalidUrlException; 
          case 401:
       
        throw InvalidUsernameException("Invalid Email or Password"); 

      default:
        throw FetchDataException(
            'error ocured while communicating to the server' +
                response.statusCode.toString());
    }
  }
}
