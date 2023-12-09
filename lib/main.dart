import 'package:flutter/material.dart';
import 'screens/GetStarted.dart';
void main() {
  runApp(const GetStartedApp());
}

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
      //home: Guest_Account(),
    );
  }
}
