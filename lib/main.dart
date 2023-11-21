import 'package:flutter/material.dart';
import 'screens/Guest_Account.dart';
import 'screens/UserMain.dart';
import 'screens/Preferences.dart';
import 'screens/GetStarted.dart';
import 'screens/Seller_Account.dart';
import 'screens/account_settings.dart';


void main() {
  runApp(const GetStartedApp());
}

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Account_Settings(),
    );
  }
}

