import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/user.dart';
import 'UserMain.dart';

import 'GeneralSettings.dart';

import 'CreateAccount.dart';
import 'Login.dart';


final User user = User(
    name: 'User_003',
    location: ' ',
    phoneNumber: ' ',
    email: ' ',
    instagramAccount: ' ',
  );

class Guest_Account extends StatelessWidget {
  bool isSignedUp = false;

  Guest_Account({super.key}); // Set to true if the user is signed up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Image.asset(
                  'assets/images/ink-logo-black-01.png',
                  width: 60,
                  height: 80,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
              title: Center(
                child: Text(
                  user.name,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold , color:Colors.black),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings), // Change the icon to settings
                  color: Colors.black,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GeneralSettings(user: user)),
                    );
                  },
                ),
              ],
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image at the top, centered
            Container(
              width: double.infinity,
              height: 200.0,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/user_male.png',
                    height: 150.0,
                    width: 150.0,
                  ),
                  const SizedBox(height: 4.0), // Reduced the space
                  const Text(
                    'Guest',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Lines of user information with more vague effect
            buildVagueUserInfoRow(
              'assets/images/location.png',
              'Wilaya',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/call.png',
              '06*******/07*******',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/email.png',
              'user.email@example.com',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/instagram.png',
              'instagram-account',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/facebook.png',
              'facebook-account',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/link.png',
              'link',
              isSignedUp,
            ),

            // Divider
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),

            // Space between Divider and Seller Account Text
            const SizedBox(height: 14.0), // Adjust the space as needed

            // Seller Account Text
            const Text(
              'Seller Account',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0), // Adjust the space as needed

            // Seller Account Description
            const Text(
              'To sell your books you need to create',
              textAlign: TextAlign.center,
            ),

            const Text(
              'a seller account.',
              textAlign: TextAlign.center,
            ),

            // Space for Image
            const SizedBox(height: 20.0), // Reduced the space
            Image.asset(
              'assets/images/book_pile.png',
              height: 75.0,
              width: 128.0,
              fit: BoxFit.cover,
            ),

            // Button - Create Account
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the CreateAccount screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFE16A3D)),
              ),
              child: const Text('Create Account'),
            ),

            // Already Have an Account Text
            const SizedBox(height: 1.0),
            GestureDetector(
              onTap: () {
                // Navigate to the Login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                    ),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Space for Bottom Navigation Bar
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildVagueUserInfoRow(
    String iconPath,
    String text,
    bool isSignedUp,
  ) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Opacity(
            opacity: isSignedUp ? 1.0 : 0.5, // Adjust the opacity value
            child: Image.asset(
              iconPath,
              height: 24.0,
              width: 24.0,
            ),
          ),
          const SizedBox(width: 8.0),
          Opacity(
            opacity: isSignedUp ? 1.0 : 0.5, // Adjust the opacity value
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey, // Change text color to black
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
