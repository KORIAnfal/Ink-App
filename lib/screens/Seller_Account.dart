import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/CustomAppBar.dart';
import 'dart:ui';

class SellerAccount extends StatelessWidget {
  bool isSignedUp = false; // Set to true if the user is signed up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CustomAppBar(
          userName: 'Iqraa Library',
          userIconPath: 'assets/images/settings.png', // Replace with the path to your user icon
),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image at the top, left-aligned
            Container(
              width: double.infinity,
              height: 200.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    height: 150.0,
                    width: 150.0,
                  ),
                  SizedBox(width: 16.0), // Adjust the space between image and text
                  Expanded(
                    child: Text(
                      'Iqraa Library',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Lines of user information with more vague effect
            buildVagueUserInfoRow(
              'assets/images/location1.png',
              'Wilaya',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/call1.png',
              '06*******/07*******',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/email1.png',
              'user.email@example.com',
              isSignedUp,
            ),
            buildVagueUserInfoRow(
              'assets/images/instagram1.png',
              'instagram-account',
              isSignedUp,
            ),
            
           
          ],
        ),
      ),
    );
  }

  Widget buildVagueUserInfoRow(
    String iconPath,
    String text,
    bool isSignedUp,
  ) {
    return Container(
      color: Colors.white, // Change the color of the container
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 24.0,
            width: 24.0,
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.black, // Change text color to black
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
