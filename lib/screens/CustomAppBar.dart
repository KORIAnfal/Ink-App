import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;

  CustomAppBar({required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5, // Set a small elevation to show the bottom line
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/logo.png', // Replace with your logo image path
          height: 30, // Adjust the height as needed
        ),
      ),
      title: Center(
        child: Text(
          userName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/settings.png', // Replace with your image path
            height: 30, // Adjust the height as needed
          ),
        ),
      ],
      
    );
  }
  
}
