import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/CustomAppBar.dart';
import 'dart:ui';
import 'UserMain.dart';

import 'GeneralSettings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'utils/user.dart';


class Book {
  final String imagePath;

  Book({required this.imagePath});
}

class SellerAccount extends StatelessWidget {
  bool isSignedUp = false; // Set to true if the user is signed up

  final User user = User(
    name: 'Iqraa Library',
    location: 'Wilaya',
    phoneNumber: '0634567893/0712009845',
    email: 'sara.email@example.com',
    instagramAccount: 'Iqraa-dz',
  );

  final List<Book> booksRow1 = [
   
  ];

  final List<Book> booksRow2 = [
   
  ];

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
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
              ),
              title: Center(
                child: Text(
                  user.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold , color:Colors.black),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings), // Change the icon to settings
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUserProfileSection(user),
            SizedBox(height: 40.0), // Adjust the spacing
            SizedBox(height: 20.0), // Add space between the sections

            // Check if there are books in the account
            booksRow1.isEmpty && booksRow2.isEmpty
                ? Center(
                    child: Text(
                      'No books available.',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  )
                : Column(
                    children: [
                      buildBookImagesContainer(booksRow1),
                      SizedBox(height: 20.0), // Adjust the spacing
                      buildBookImagesContainer(booksRow2),
                    ],
                  ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget buildUserProfileSection(User user) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/profile.png',
                height: 150.0,
                width: 150.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          buildVagueUserInfoRow(
            'assets/images/location1.png',
            user.location,
            isSignedUp,
          ),
          buildVagueUserInfoRow(
            'assets/images/call1.png',
            user.phoneNumber,
            isSignedUp,
          ),
          buildVagueUserInfoRow(
            'assets/images/email1.png',
            user.email,
            isSignedUp,
          ),
          buildVagueUserInfoRow(
            'assets/images/instagram1.png',
            user.instagramAccount,
            isSignedUp,
          ),
        ],
      ),
    );
  }

  Widget buildVagueUserInfoRow(
    String iconPath,
    String text,
    bool isSignedUp,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
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
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBookImagesContainer(List<Book> books) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              books[index].imagePath,
              height: 122.5, // Set the same height for all images
              width: 100.0, // Set the same width for all images
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
