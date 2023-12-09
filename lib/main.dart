import 'package:flutter/material.dart';
import 'screens/GetStarted.dart';
import 'screens/BookDetailsUser.dart';

import 'package:ink/database/DB_Helper.dart';
import 'package:ink/models/book.dart';
import 'package:ink/models/seller.dart';
import 'package:ink/models/selling.dart';


Future<void> insertSampleData() async {
  DBHelper dbHelper = DBHelper();

  // Insert a sample book
  Book sampleBook = Book(
    id: 2,
    title: 'Sample Book',
    author: 'John Doe',
    summary: 'A sample book for testing',
    imagePath: '1.jpg',
    isbn: 123456789,
  );
  await dbHelper.insertBook(sampleBook);

  // Insert a sample seller
  Seller sampleSeller = Seller(
    id: 2,
    name: 'Seller Name',
    accountName: 'seller_account',
    profileImagePath: 'seller_profile.jpg',
    instagramLink: 'instagram.com/seller',
    email: 'seller@example.com',
    phoneNumber: '123-456-7890',
    location: 'Seller City',
  );
  await dbHelper.insertSeller(sampleSeller);

  // Insert a sample selling
  Selling sampleSelling = Selling(
    id: 2,
    book: sampleBook,
    seller: sampleSeller,
    price: 20.0,
    isDeliveryAvailable: true,
    isForSell: true,
    isForExchange: false,
  );
  await dbHelper.insertSelling(sampleSelling);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  // Insert sample data
  await insertSampleData();

  // Run your app
  runApp(const GetStartedApp());
}



class GetStartedApp extends StatelessWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BookDetailsUserScreen(bookId: 1), 
      //home: Guest_Account(),
    );
  }
}
