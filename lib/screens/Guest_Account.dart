import 'package:flutter/material.dart';
import 'CustomAppBar.dart';

class Guest_Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CustomAppBar(userName: 'User_003'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image at the top, centered
          Container(
            width: double.infinity,
            height: 200.0, // Adjust the height as needed
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/user_male.png', // Replace with your image path
                  height: 150.0, // Adjust the height as needed
                  width: 150.0, // Adjust the width as needed
                ),
                SizedBox(height: 4.0), // Adjust the height as needed
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
          // Lines of user information without transparent effect
          SizedBox(height: 16.0),
          buildUserInfoRow('assets/email.png', 'user.email@example.com'),
          buildUserInfoRow('assets/call.png', '123-456-7890'),
          buildUserInfoRow('assets/location.png', '123 Main Street, City'),
          // Divider
        Divider(
            color: Colors.grey, // Change the color to grey or any preferred color
            thickness: 0.5, // Adjust the thickness as needed
          ),
          // Add more user information rows as needed
        ],
      ),
    );
  }

  Widget buildUserInfoRow(String iconPath, String text) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          height: 24.0, // Adjust the height as needed
          width: 24.0, // Adjust the width as needed
        ),
        SizedBox(width: 8.0),
        Text(text,
            style: TextStyle(color: Colors.black)), // Adjust text color if needed
      ],
    );
  }
}
