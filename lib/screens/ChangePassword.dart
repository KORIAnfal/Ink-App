import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              _buildPasswordInput('Old Password'),
              SizedBox(height: 16.0),
              _buildPasswordInput('New Password'),
              SizedBox(height: 16.0),
              _buildPasswordInput('Confirm Password'),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Implement cancel logic
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFFE16A3D)),
                      minimumSize: Size(120, 50),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFFE16A3D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showChangePasswordDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE16A3D),
                      onPrimary: Colors.white,
                      minimumSize: Size(120, 50),
                    ),
                    child: Text('Change'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput(String label) {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE16A3D)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  // Function to show the change password success dialog with illustration
  Future<void> _showChangePasswordDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
          title: Text('Password Changed Successfully'),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            child: Container(
              height: 200, // Adjust the height based on your design
              width: 200,  // Adjust the width based on your design
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/change_psw.png', // Replace with your PNG asset path
                    height: 120,
                    width: 120,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your password has been changed successfully.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.black, // Change the text color to black
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


