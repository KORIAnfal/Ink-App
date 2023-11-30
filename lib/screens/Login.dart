import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/book_login.png', // Replace with your image asset
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.white.withOpacity(0.5), // Adjust the opacity as needed
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black, // Change text color to black
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black), // Change text color to black
                    prefixIcon: Icon(Icons.email, color: Colors.black), // Change icon color to black
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Change border color to black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Change focused border color to black
                    ),
                  ),
                  style: TextStyle(color: Colors.black), // Change text color to black
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black), // Change text color to black
                    prefixIcon: Icon(Icons.lock, color: Colors.black), // Change icon color to black
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Change border color to black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Change focused border color to black
                    ),
                  ),
                  style: TextStyle(color: Colors.black), // Change text color to black
                ),
                SizedBox(height: 20.0),
                Center(
                  // Center the login button
                  child: ElevatedButton(
                    onPressed: () {
                      _showLoginSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE16A3D), // Use the specified color
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black), // Change text color to black
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black), // Change text color to black
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to the registration screen
                      },
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.black, // Change text color to black
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLoginSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/book_user.png', // Add your success illustration
                height: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Login Successful!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFE16A3D), // Use the specified color
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
