import 'package:flutter/material.dart';
import 'CreateAccount.dart';
import 'package:ink/screens/utils/userAuthentication.dart';

class LoginScreen extends StatefulWidget {
 
   LoginScreen({Key? key}) : super(key: key);
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _txEmailController = TextEditingController();
  final TextEditingController _txPassController = TextEditingController();
   bool show_progress_bar = false;
  String error_message = '';

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
            color: Colors.white.withOpacity(0.5),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: _txEmailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _txPassController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      action_handle_login_button();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE16A3D),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateAccountScreen()),
                        );
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.black,
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
  void action_handle_login_button() async {
  show_progress_bar = true;
  error_message = '';
  setState(() {});

  String result = await UserAuthentication.loginUser(
      _txEmailController.text, _txPassController.text);

  if (result != 'success') {
    error_message = result;
  } else {
    // Do something upon successful login

    // Show the success dialog
    _showLoginSuccessDialog(context);
  }

  show_progress_bar = false;
  setState(() {});
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
                'assets/images/book_user.png',
                height: 100.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Login Successful!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE16A3D),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
