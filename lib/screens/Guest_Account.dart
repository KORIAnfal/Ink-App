import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/CustomAppBar.dart';
import 'utils/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CreateAccount.dart';
import 'Login.dart';

import 'dart:ui';

class Guest_Account extends StatelessWidget {
  bool isSignedUp = false; // Set to true if the user is signed up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
  preferredSize: AppBar().preferredSize,
  child: CustomAppBar(
    userName: 'User_003',
    userIcon: FontAwesomeIcons.cog, // Replace with the desired FontAwesome icon
  ),
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
                  SizedBox(height: 4.0), // Reduced the space
                  Text(
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
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),

            // Space between Divider and Seller Account Text
            SizedBox(height: 14.0), // Adjust the space as needed

            // Seller Account Text
            Text(
              'Seller Account',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0), // Adjust the space as needed

            // Seller Account Description
            Text(
              'To sell your books you need to create',
              textAlign: TextAlign.center,
            ),

            Text(
              'a seller account.',
              textAlign: TextAlign.center,
            ),

            // Space for Image
            SizedBox(height: 20.0), // Reduced the space
            Image.asset(
              'assets/images/book_pile.png',
              height: 75.0,
              width: 128.0,
              fit: BoxFit.cover,
            ),

            // Button - Create Account
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the CreateAccount screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateAccountScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFE16A3D)),
              ),
              child: Text('Create Account'),
            ),

            // Already Have an Account Text
            SizedBox(height: 1.0),
            GestureDetector(
              onTap: () {
                // Navigate to the Login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: RichText(
                text: TextSpan(
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
      bottomNavigationBar: CustomBottomNavigationBar(),
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
          SizedBox(width: 8.0),
          Opacity(
            opacity: isSignedUp ? 1.0 : 0.5, // Adjust the opacity value
            child: Text(
              text,
              style: TextStyle(
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
