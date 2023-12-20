import 'package:flutter/material.dart';
import 'package:ink/screens/UserMain.dart';
import 'package:ink/screens/Seller_Account.dart';
import 'package:ink/screens/search_filter.dart';
import 'package:ink/screens/AddaBook/add_Isbn_dailog.dart';
import 'package:ink/screens/utils/userAuthentication.dart';
import 'package:ink/models/seller.dart';


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

  void _navigateToScreen(int index) async {
  setState(() {
    _selectedIndex = index;
  });

  switch (index) {
    case 0:
      _navigateAndSetIndex(const MainScreen(), 0);
      break;
    case 1:
      ISBNPopupDialog.show(context);
      break;
    case 2:
      _navigateAndSetIndex(const Search_Filter(), 2);
      break;
    case 3:
      SellerInfoScreen sellerInfoScreen = await _getSellerInfoScreen();
      _navigateAndSetIndex(sellerInfoScreen, 3);
      break;
  }
}

Future<SellerInfoScreen> _getSellerInfoScreen() async {
  // Get logged-in user information
  Seller? loggedUser = await UserAuthentication.getLoggedUser();

  // Check if the user is a seller and obtain the seller user ID
  if (loggedUser != null) {
    String sellerUserId = await UserAuthentication.getUserIdFromResult(loggedUser.id.toString());

    // Check if sellerUserId is not empty before creating SellerInfoScreen
    if (sellerUserId.isNotEmpty) {
      return SellerInfoScreen(sellerUserId: sellerUserId);
    } else {
      // Handle the case where sellerUserId is empty
      // For now, navigate to a default screen or show an error message
      return const SellerInfoScreen(sellerUserId: 'DefaultUserId');
    }
  } else {
    // Handle the case where the user is not logged in or is not a seller
    // For now, navigate to a default screen or show an error message
    return const SellerInfoScreen(sellerUserId: 'DefaultUserId');
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