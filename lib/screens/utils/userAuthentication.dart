import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:ink/constants/endpoints.dart';
import 'package:ink/main.dart';

class UserAuthentication {
  static Future<String> signupUser(Map data) async {
    Map<String, dynamic> form_data = {
      'id': 3,
      'accountname': data['accountname'],
      'email': data['email'],
      'password': data['password'],
      'imagepath': data['imagepath'],
      'insta': data['insta'],
      'face': data['face'],
      'phonenumber': data['phonenumber'],
      'wilaya': data['wilaya'],
      'region': data['region'],
    };
    print(data);
    var response = await dio.post(api_endpoint_user_sign,
        data: FormData.fromMap(form_data));
    print(response);
    String error_msg = '';
    Map ret_data = jsonDecode(response.toString());
    if (ret_data['status'] == 200) {
      Map<String, dynamic> data = ret_data['data'];
      if (prefs != null) {
        prefs!.setString("user_id", "${data['id']}");
        prefs!.setString("user_email", data['email']);
        prefs!.setString("user_password", data['password']);
      }
      return 'success';
    }
    error_msg = ret_data?['message'];
    return 'Error : $error_msg';
  }
}
