import 'package:flutter/material.dart';

class Account_Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Account Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFCCCCCC), // Set the color to #CCCCCC
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ActionBox(
            title: 'Edit Account',
            imagePath: 'assets/images/edit.png',
            onPressed: () {
              // Handle Edit Account action
              print('Edit Account pressed');
            },
            isOrange: false, // Set the orange color for this text
          ),
          ActionBox(
            title: 'Change Password',
            imagePath: 'assets/images/change_password.png',
            onPressed: () {
              // Handle Change Password action
              print('Change Password pressed');
            },
            isOrange: false, // Set the orange color for this text
          ),
          ActionBox(
            title: 'Delete Account',
            imagePath: 'assets/images/delete_account.png',
            onPressed: () {
              // Handle Delete Account action
              print('Delete Account pressed');
            },
            isOrange: true, // Set the orange color for this text
          ),
        ],
      ),
    );
  }
}

class ActionBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onPressed;
  final bool isOrange; // New property to indicate whether to use orange color

  ActionBox({
    required this.title,
    required this.imagePath,
    this.onPressed,
    this.isOrange = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70.0, // Set the default height for all boxes
        margin: EdgeInsets.all(8.0), // Smaller margin
        padding: EdgeInsets.all(8.0), // Smaller padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0), // Smaller border radius
          border: Border.all(color: Color(0xFFCCCCCC)), // Set border color to #CCCCCC
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 27.0, // Smaller width
              height: 27.0, // Smaller height
              color: isOrange ? Color(0xFFE16A3D) : Colors.black, // Use orange color if specified
            ),
            SizedBox(width: 8.0), // Smaller spacing
            Text(
              title,
              style: TextStyle(
                fontSize: 14.0, // Smaller font size
                fontWeight: FontWeight.bold,
                color: isOrange ? Color(0xFFE16A3D) : Colors.black, // Use orange color if specified
              ),
            ),
          ],
        ),
      ),
    );
  }
}
