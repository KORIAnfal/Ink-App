import 'package:flutter/material.dart';
import 'screens/GetStarted.dart';
import 'screens/Seller_Account.dart';

void main() {
  runApp(const GetStartedApp());
}

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
      //home: Guest_Account(),
    );
  }
}
