import 'package:flutter/material.dart';
import 'HelpCenter.dart';
import 'Seller_Account.dart' as SellerAccount;
import 'account_settings.dart';
import 'utils/user.dart';
import 'UserMain.dart';

class GeneralSettings extends StatefulWidget {
  final User user;

  GeneralSettings({Key? key, required this.user}) : super(key: key);

  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  String selectedLanguage = 'English'; // Default language
  List<String> languages = [
    'English',
    'Arabic',
    'French',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        ],
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Handle logo click
            },
            child: Image.asset(
              'assets/images/logo.png',
              width: 40.0,
              height: 40.0,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSetting('View Profile', Icons.person, onTap: () {
            // Handle profile click
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SellerAccount.SellerAccount()),
            );
          }),
          SizedBox(height: 16.0),
          _buildSetting('Account Settings', Icons.settings, onTap: () {
            // Handle account settings click
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Account_Settings()),
            );
          }),
          _buildLanguageSetting(),
          _buildSetting('Help Center', Icons.help, onTap: () {
            // Handle help center click
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpCenterScreen()),
            );
          }),
          SizedBox(height: 250.0),
          _buildSetting('Logout', Icons.logout, onTap: () {
            // Handle logout click
            _showLogoutDialog(context);
          }),
        ],
      ),
    );
  }

  Widget _buildSetting(String title, IconData icon, {Function? onTap}) {
    if (title == 'View Profile') {
      return GestureDetector(
        onTap: onTap as void Function()?,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'View Profile',
                    style: TextStyle(
                      color: Color(0xFFE16A3D),
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (title == 'Logout') {
      return GestureDetector(
        onTap: onTap as void Function()?,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Material(
            color: Colors.transparent,
            elevation: 0.5,
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: onTap as void Function()?,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Color(0xFFE16A3D), size: 30.0),
                    SizedBox(width: 12.0),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xFFE16A3D),
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          color: Colors.transparent,
          elevation: 0.5,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: onTap as void Function()?,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.black, size: 30.0),
                  SizedBox(width: 12.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  if (title == 'Language') Spacer(),
                  if (title == 'Language')
                    Row(
                      children: [
                        Icon(Icons.language, color: Colors.black, size: 30.0),
                        SizedBox(width: 8.0),
                        Text(
                          '$title $selectedLanguage',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildLanguageSetting() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.5,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {
            _showLanguageDialog(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Icon(Icons.language, color: Colors.black, size: 30.0),
                SizedBox(width: 12.0),
                Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_drop_down, color: Colors.black, size: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Logout', style: TextStyle(fontSize: 30.0)),
                  Divider(color: Colors.grey),
                  SizedBox(height: 12.0),
                  Text('Are you sure you want to logout?',
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFE16A3D),
                          onPrimary: Colors.white,
                          minimumSize:
                              Size(150.0, 50.0), // Adjusted minimumSize
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.white, size: 30.0),
                            SizedBox(width: 12.0),
                            Text(
                              'Logout',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Colors.black), // Changed to black
                          minimumSize:
                              Size(150.0, 50.0), // Adjusted minimumSize
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12.0),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black), // Changed to black
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: SingleChildScrollView(
            child: Column(
              children: languages.map((language) {
                return ListTile(
                  title: Text(language,
                      style: TextStyle(
                          color: language == selectedLanguage
                              ? Color(0xFFE16A3D)
                              : Colors.black)),
                  onTap: () {
                    setState(() {
                      selectedLanguage = language;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
