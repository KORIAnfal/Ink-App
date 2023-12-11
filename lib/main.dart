import 'package:flutter/material.dart';
import 'package:ink/screens/GetStarted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the file where DefaultFirebaseOptions is defined

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
