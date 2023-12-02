import 'package:flutter/material.dart';
import 'screens/GetStarted.dart';
import 'screens/Seller_Account.dart';
import 'screens/Add_book.dart';
import 'screens/search_filter.dart';
import 'screens/Add_book_post.dart';
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
