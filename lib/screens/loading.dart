import 'package:flutter/material.dart';


class Loadingscreen extends StatelessWidget {
  const Loadingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFD5B5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/ink-logo-orange.png'),
                height: 180, // Adjust the height as needed
                width: 180, // Adjust the width as needed
                fit: BoxFit.contain, // You can adjust the BoxFit as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}