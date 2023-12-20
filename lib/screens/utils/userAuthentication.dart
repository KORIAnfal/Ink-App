import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ink/models/seller.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ink/constants/endpoints.dart';
import 'package:ink/main.dart';

class UserAuthentication {
  // Modify the getLoggedUser function to return a Seller
  static Future<Seller?> getLoggedUser() async {
    String? uid = prefs?.getString("user_id");
    String? email = prefs?.getString("user_email");
    String? password = prefs?.getString("user_password");
    print(prefs);
    if (uid != null &&
        email != null &&
        password != null &&
        uid.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      return Seller(
        id: int.parse(uid), // Assuming id is an integer
        accountName: 'Your name',
        profileImagePath: '', // Provide a default value for profileImagePath
        instagramLink: '', // Provide a default value for instagramLink
        FaceBookLink: '', // Provide a default value for FaceBookLink
        email: email,
        phoneNumber: '', // Provide a default value for phoneNumber
        wilaya: '', // Provide a default value for wilaya
        region: '', // Provide a default value for region
        password: password,
      );
    } else {
      return null;
    }
  }




 static Future<bool> logoutUser(Seller seller) async {
    await Future.delayed(Duration(seconds: 5));
    return true;
  }


  static Future<String> signupUser(Map<String, dynamic> data) async {
    try {
     List<String> selectedSubcategories = data['preferences']['selectedSubcategories'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('selectedSubcategories', selectedSubcategories);

      String accountName = data['accountname'] ?? '';
      String email = data['email'] ?? '';
      String password = data['password'] ?? '';
      String insta = data['insta'] ?? '';
      String face = data['face'] ?? '';
      String phoneNumber = data['phonenumber'] ?? '';
      String wilaya = data['wilaya'] ?? '';
      String region = data['region'] ?? '';

      // Upload the image to Supabase Storage
      String imagePathInStorage =
          await uploadImageToStorage(data['imagepath'], accountName);

      // Add the image path to the form data
      Map<String, dynamic> form_data = {
        'accountname': accountName,
        'email': email,
        'password': password,
        'imagepath': imagePathInStorage,
        'insta': insta,
        'face': face,
        'phonenumber': phoneNumber,
        'wilaya': wilaya,
        'region': region,
      };

      var response = await dio.post(api_endpoint_user_sign,
          data: FormData.fromMap(form_data));
      print(response);

      String error_msg = '';
      Map ret_data = jsonDecode(response.toString());

      if (ret_data['status'] == 200) {
        Map<String, dynamic> userData = ret_data['data'];
        prefs?.setString("user_id", "${userData['id']}");
        prefs?.setString("user_email", userData['email']);
        prefs?.setString("user_password", userData['password']);
        return 'success';
      }

      error_msg = ret_data?['message'];
      return 'Error: $error_msg';
    } catch (e) {
      // Handle exceptions or unexpected errors
      return 'Error: ${e.toString()}';
    }
  }

  static Future<String> uploadImageToStorage(
      String? imagePath, String accountName) async {
    if (imagePath == null) {
      print("No image uploaded");
      return '';
    }

    try {
      final storage = supabase.storage;

      // Append the user's account name to the file name
      String fileName = '$accountName-${basename(imagePath)}';

      final response = await storage
          .from('userimages') // Replace with your actual storage bucket name
          .upload(fileName, File(imagePath));

      // Use the response data(), assuming it contains the relativePath
      return response ;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }



  
  static Future<String> loginUser(String email, String password) async {
    //verify::
    Map<String, dynamic> form_data = {'email': email, 'password': password};

    var response = await dio.post(api_endpoint_user_login,
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


 static String getUserIdFromResult(String result) {
    try {
      // Parse the JSON result
      Map<String, dynamic> jsonResult = json.decode(result);

      // Extract the user ID from the JSON result
      String userId = jsonResult['id'];

      // Check if the user ID is not null or empty
      if (userId != null && userId.isNotEmpty) {
        return userId;
      } else {
        // Handle the case where the user ID is missing or empty
        return 'UnknownUserId'; // You can return a default or handle it as needed
      }
    } catch (e) {
      // Handle JSON parsing error
      print('Error parsing JSON: $e');
      return 'UnknownUserId'; // Return a default or handle the error as needed
    }
  }


   static Future<Map<String, dynamic>?> getSellerInfo(String sellerUserId) async {
    try {
      final response = await dio.get(
        api_endpoint_seller_info,
        queryParameters: {'seller_user_id': sellerUserId},
      );

      if (response.statusCode == 200) {
        return response.data.isNotEmpty ? response.data : null;
      } else {
        print('Failed to load seller info: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during API call: $e');
      return null;
    }
  }
}
