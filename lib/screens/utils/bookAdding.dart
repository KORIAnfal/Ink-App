import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:ink/constants/endpoints.dart';
import 'package:ink/main.dart';
import 'package:path/path.dart';

class Book {
  static Dio dio = Dio();
  static Future<String> addbook(Map data) async {
    print("hi from addbook class book");
  String imagePathInStorage = await uploadImageToStorage(data['imagepath'],data['isbn'].toString());
    print(imagePathInStorage);
    Map<String, dynamic> form_data = {
      'isbn': data['isbn'],
      'title': data['title'],
      'authors': data['authors'],
      'summary': data['summary'],
      'imagepath': imagePathInStorage,
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

  static Future<String> uploadImageToStorage(String? imagePath, String isbn) async {
    if (imagePath == null) {
      print("No image uploaded");
      return '';
    }

    try {
      print("uploading.,,,,,1");
      final storage = supabase.storage;

      // Append the user's account name to the file name
      String fileName = '$isbn-${basename(imagePath)}';
      print("uploading.,,,,,2");
      final response = await storage
          .from('book Images') // Replace with your actual storage bucket name
          .upload(fileName, File(imagePath));
      print("uploading.,,,,,3 $response");
      // Use the response data(), assuming it contains the relativePath
      return response ;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

}