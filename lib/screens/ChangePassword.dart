import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
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
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Adjusted spacing
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Implement cancel logic
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFFE16A3D)),
                      minimumSize: Size(120, 50), // Adjusted minimumSize
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(
                            0xFFE16A3D), // Set cancel text color to orange
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement change password logic
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
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black), // Set label color
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility, color: Colors.black), // Set icon color
          onPressed: () {
            // TODO: Implement toggle password visibility
          },
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE16A3D)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Set border color
        ),
      ),
    );
  }
}
