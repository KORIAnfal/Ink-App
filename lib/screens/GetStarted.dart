import 'package:flutter/material.dart';
import 'Preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserMain.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);
   Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Check if user ID is present in SharedPreferences (you may need a more complex check)
    return prefs.getString("user_id") != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFD5B5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 200), // Adjust the height as needed
              const Image(
                image: AssetImage('assets/images/ink-logo-orange.png'),
                height: 180, // Adjust the height as needed
                width: 180, // Adjust the width as needed
                fit: BoxFit.contain, // You can adjust the BoxFit as needed
              ),
              const SizedBox(height: 20), // Add space between the image and text 1
              const Text(
                'Ink',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Add space between text 1 and text 2
              const Center(
                child: Text(
                  'Read, sell and exchange books ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center, // Center horizontally
                ),
                
              ),
              const SizedBox(height: 0), // Add space between text 1 and text 2
              const Center(
                child: Text(
                  'all in one app ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center, // Center horizontally
                ),
                
              ),
              const SizedBox(height: 40), // Add space between the last text and the button
              ElevatedButton(
                onPressed: () async {
    bool userLoggedIn = await isLoggedIn();

    if (userLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Preferencescreen()),
      );
    }
  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE16A3D),
                  fixedSize: const Size(231, 49), // Set the background color
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}