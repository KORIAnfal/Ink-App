import 'package:flutter/material.dart';
import 'package:ink/screens/AddaBook/Add_book.dart';
import 'package:ink/screens/GetStarted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the file where DefaultFirebaseOptions is defined
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/seller.dart';
import 'package:supabase/supabase.dart';  // Import the Supabase package
import 'package:ink/screens/utils/userAuthentication.dart';

final dio = Dio();
SharedPreferences? prefs;
Seller? seller;

// Initialize Supabase
final supabase = SupabaseClient(
  'https://mqlvalzpuinscoobhwmc.supabase.co/',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1xbHZhbHpwdWluc2Nvb2Jod21jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1NTg5ODgsImV4cCI6MjAxODEzNDk4OH0.dQvLZY48nWc2LTObRfDbCwPup-ehkhf9rO_GoeadGUg',
);

Future<bool> my_init_app() async {
  prefs = await SharedPreferences.getInstance();
  seller = await UserAuthentication.getLoggedUser();
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Continue with your existing initialization code
  await my_init_app();

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