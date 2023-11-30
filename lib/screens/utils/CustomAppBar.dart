import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final IconData userIcon; // Change from String to IconData

  CustomAppBar({required this.userName, required this.userIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/ink-logo-black-01.png',
          height: 30,
          semanticLabel: 'Ink Logo',
        ),
      ),
      title: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            userName,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            userIcon, // Use the provided IconData
            size: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
