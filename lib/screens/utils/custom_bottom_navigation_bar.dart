import 'package:flutter/material.dart';
import 'package:ink/screens/Guest_Account.dart';
import 'package:ink/screens/UserMain.dart';
import 'package:ink/screens/Add_book.dart';
import 'package:ink/screens/Seller_Account.dart';
import 'package:ink/screens/search_filter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildNavItem(Icons.home, 0),
        _buildNavItem(Icons.add_circle, 1),
        _buildNavItem(Icons.search, 2),
        _buildNavItem(Icons.person, 3),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        _navigateToScreen(index);
      },
      iconSize: _selectedIndex == 0 ? 30.0 : 24.0,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      // Set all labels to black, no matter the state
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        // Adjust size when the item is selected
        size: _getIconSize(index),
      ),
      label: '',
    );
  }

  double _getIconSize(int index) {
    return _selectedIndex == index ? 30.0 : 24.0;
  }

  void _navigateToScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        _navigateAndSetIndex(MainScreen(), 0);
        break;
       case 1:
        _navigateAndSetIndex(Add_book(), 1);
        break;
       case 2:
        _navigateAndSetIndex(Search_Filter(), 2);
         break;
      case 3:
        _navigateAndSetIndex(SellerAccount(), 3);
        break;
    }
  }

  void _navigateAndSetIndex(Widget page, int index) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page)).then((value) {
      setState(() {
        _selectedIndex = index;
      });
    });
  }
}