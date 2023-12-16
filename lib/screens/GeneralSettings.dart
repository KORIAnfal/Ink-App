import 'package:flutter/material.dart';
import 'HelpCenter.dart';
import 'Seller_Account.dart' as SellerAccount;
import 'account_settings.dart';
import 'utils/user.dart';
import 'UserMain.dart';

class GeneralSettings extends StatefulWidget {
  final User user;

  const GeneralSettings({Key? key, required this.user}) : super(key: key);

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
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
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
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSetting('View Profile', Icons.person, onTap: () {
            // Handle profile click
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainScreen()),
            );
          }),
          const SizedBox(height: 16.0),
          _buildSetting('Account Settings', Icons.settings, onTap: () {
            // Handle account settings click
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Account_Settings()),
            );
          }),
          _buildLanguageSetting(),
          _buildSetting('Help Center', Icons.help, onTap: () {
            // Handle help center click
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpCenterScreen()),
            );
          }),
          const SizedBox(height: 250.0),
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
          margin: const EdgeInsets.symmetric(vertical: 8.0),
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
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
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
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Material(
            color: Colors.transparent,
            elevation: 0.5,
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Row(
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
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          color: Colors.transparent,
          elevation: 0.5,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: onTap as void Function()?,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.black, size: 30.0),
                  const SizedBox(width: 12.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  if (title == 'Language') const Spacer(),
                  if (title == 'Language')
                    Row(
                      children: [
                        const Icon(Icons.language, color: Colors.black, size: 30.0),
                        const SizedBox(width: 8.0),
                        Text(
                          '$title $selectedLanguage',
                          style: const TextStyle(
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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.5,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {
            _showLanguageDialog(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: const Row(
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Logout', style: TextStyle(fontSize: 30.0)),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 12.0),
                  const Text('Are you sure you want to logout?',
                      style: TextStyle(fontSize: 20.0)),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: const Color(0xFFE16A3D),
                          minimumSize:
                              const Size(150.0, 50.0), // Adjusted minimumSize
                        ),
                        child: const Row(
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
                      const SizedBox(width: 20.0),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.black), // Changed to black
                          minimumSize:
                              const Size(150.0, 50.0), // Adjusted minimumSize
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        child: const Row(
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
          title: const Text('Select Language'),
          content: SingleChildScrollView(
            child: Column(
              children: languages.map((language) {
                return ListTile(
                  title: Text(language,
                      style: TextStyle(
                          color: language == selectedLanguage
                              ? const Color(0xFFE16A3D)
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
