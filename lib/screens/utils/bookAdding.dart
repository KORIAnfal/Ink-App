import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:ink/constants/endpoints.dart';
import 'package:ink/main.dart';

class Book {
  static Dio dio = Dio();
  static Future<String> addbook(Map data) async {

    Map<String, dynamic> form_data = {
      'isbn': data['isbn'],
      'title': data['title'],
      'authors': data['authors'],
      'summary': data['summary'],
      'imagepath': data['imagepath'],
    };

    print(form_data.toString());
    var response = await dio.post(api_endpoint_seller_addbook,
        data: FormData.fromMap(form_data));
    print(response);

    String error_msg = '';
    Map ret_data = jsonDecode(response.toString());
    if (ret_data['status'] == 200) {

      return 'success';
    }
    error_msg = ret_data?['message'];
    return 'Error : $error_msg';
  }

static Future<String> existISBN() async {

    var response = await dio.post(api_endpoint_seller_addbook);

    print(response);

    String error_msg = '';
    Map ret_data = jsonDecode(response.toString());
    if (ret_data['status'] == 200) {

      return 'success';
    }
    error_msg = ret_data?['message'];
    return 'Error : $error_msg';
  }


}