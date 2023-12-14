import 'package:flutter/material.dart';
import 'package:ink/screens/GetStarted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the file where DefaultFirebaseOptions is defined
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/seller.dart';
import 'package:ink/screens/utils/userAuthentication.dart';

final dio = Dio();
SharedPreferences? prefs;
Seller? seller;

Future<bool> my_init_app() async {
  prefs = await SharedPreferences.getInstance();
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const GetStartedApp());
}

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
    );
  }
}
