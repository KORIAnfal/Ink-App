import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'utils/custom_bottom_navigation_bar.dart';
import 'Seller_Account.dart' as SellerAccount;



class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController facebookLinkController = TextEditingController();
  final TextEditingController instagramLinkController = TextEditingController();

  // Added lists for wilaya and region dropdowns
   List<String> wilayas = ['Oran', 'Algries', 'Annaba'];
  List<String> regions = ['Region 1', 'Region 2', 'Region 3'];

  String selectedWilaya = 'Oran';
  String selectedRegion = 'Region 1';

  PickedFile? pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create an account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                // Centered avatar image
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // Removed the Border property to remove the blue border
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: pickedImage != null
                            ? FileImage(File(pickedImage!.path))
                                as ImageProvider<Object>?
                            : AssetImage('assets/images/user_male.png'),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Text for uploading profile photo
                    GestureDetector(
                      onTap: _pickImage,
                      child: Text(
                        'Upload Profile Photo',
                        style: TextStyle(
                          color: Color(0xFFE16A3D),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                // TextFields for name, phone, email, password, and password confirmation
                _buildTextField('Full Name', nameController, Icons.person,
                    isPassword: false, isRequired: true),
                // Dropdowns for wilaya and region
                _buildDropdown('Wilaya', wilayas, selectedWilaya),
                _buildDropdown('Region', regions, selectedRegion),
                _buildTextField('Phone Number', phoneController, Icons.phone,
                    isPassword: false,
                    isRequired: true,
                    keyboardType: TextInputType.phone),
                _buildTextField('Email', emailController, Icons.email,
                    isPassword: false, isRequired: true),
                _buildTextField('Password', passwordController, Icons.lock,
                    isPassword: true, isRequired: true),
                _buildTextField(
                    'Confirm Password', confirmPasswordController, Icons.lock,
                    isPassword: true, isRequired: true),
                SizedBox(height: 16.0),
                // Rectangle for adding links
                _buildLinksRectangle(),
                SizedBox(height: 16.0),
                // Row for Cancel and Create Account buttons
                Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle cancel logic here
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return Colors.white; // White background
                            },
                          ),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                            (Set<MaterialState> states) {
                              return BorderSide(
                                  color: Color(0xFFE16A3D)); // Border color
                            },
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xFFE16A3D)),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    // Create Account Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _validateAndCreateAccount,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color(0xFFE16A3D);
                              }
                              return Color(
                                  0xFFE16A3D); // Use the same color for unpressed state
                            },
                          ),
                        ),
                        child: Text('Create Account'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool isPassword = false,
      bool isRequired = false,
      TextInputType? keyboardType}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'This field is required';
              }

              if (label == 'Phone Number' &&
                  (value!.length != 10 || !value.isNumericOnly)) {
                return 'Please enter a valid 10-digit phone number';
              }

              if (label == 'Email' &&
                  (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value))) {
                return 'Please enter a valid email address';
              }

              if (label == 'Password' &&
                  (value == null || value.isEmpty || value.length < 6)) {
                return 'Password must be at least 6 characters';
              }

              if (label == 'Confirm Password' &&
                  value != passwordController.text) {
                return '';
              }

              return null;
            },
            onChanged: (value) {
              // Clear confirm password error message when typing in the password field
              if (label == 'Password') {
                setState(() {
                  _confirmPasswordError = null;
                });
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: label,
              suffixIcon: Icon(icon, color: Color(0xFFE16A3D)),
            ),
          ),
          // Display error message for confirm password
          if (label == 'Confirm Password' && _confirmPasswordError != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 12.0),
              child: Text(
                _confirmPasswordError!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLinksRectangle() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media Links',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          // Facebook Link TextField
          TextFormField(
            controller: facebookLinkController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: 'Add Facebook Link',
              suffixIcon: Icon(Icons.link, color: Color(0xFFE16A3D)),
            ),
          ),
          SizedBox(height: 8.0),
          // Instagram Link TextField
          TextFormField(
            controller: instagramLinkController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: 'Add Instagram Link',
              suffixIcon: Icon(Icons.link, color: Color(0xFFE16A3D)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _confirmPasswordError;

  void _validateAndCreateAccount() {
    setState(() {
      _confirmPasswordError =
          confirmPasswordController.text != passwordController.text
              ? 'Passwords do not match'
              : null;
    });

    if (_formKey.currentState!.validate() && _confirmPasswordError == null) {
      // All fields are valid, proceed with account creation
      // You can display a pop-up or navigate to another screen
      _showAccountCreatedDialog();
    }
  }

  void _showAccountCreatedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/book_user.png',
                      height: 120.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Icon(Icons.check_circle, color: Colors.green, size: 40.0),
                  SizedBox(height: 16.0),
                  Text(
                    'Account Created Successfully',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'You can now add books with your new account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      _navigateToSellerAccountScreen(); // Navigate to the seller account screen
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE16A3D),
                    ),
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToSellerAccountScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SellerAccount.SellerAccount()),
    );
  }
}

extension StringExtension on String {
  bool get isNumericOnly => RegExp(r'^\d+$').hasMatch(this);
}
