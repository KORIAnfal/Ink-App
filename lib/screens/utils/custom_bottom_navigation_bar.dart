import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png', height: 20.0, width: 20.0),
          label: '',  // Set an empty string as the label
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/add.png', height: 20.0, width: 20.0),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/search.png', height: 20.0, width: 20.0),
          label: '',
        ),
      ],
      iconSize: 24.0,  // Set the icon size as needed
      selectedFontSize: 0.0,  // Hide the labels
      unselectedFontSize: 0.0,  // Hide the labels
    );
  }
}
