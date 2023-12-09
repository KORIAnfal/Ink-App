import 'package:flutter/material.dart';
import 'add_isbn_dialog1.dart';

class ISBNPopupDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFFE6864E),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'How to add ISBN?',
                        style: TextStyle(
                          color: Color(0xFFE6864E),
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromRGBO(0, 0, 0, 0.21),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 133.76,
                        width: 190.61,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/scan.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Scan the book\'s ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ISBN',
                              style: TextStyle(
                                color: Color(0xFFE6864E),
                              ),
                            ),
                            TextSpan(
                              text: ' with your camera',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'OR',
                        style: TextStyle(
                          color: Color(0xFF016A6D),
                          fontSize: 23.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 133.76,
                        width: 190.61,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/enter.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Enter the book\'s ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ISBN',
                              style: TextStyle(
                                color: Color(0xFFE6864E),
                              ),
                            ),
                            TextSpan(
                              text: ' manually',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Align(
  alignment: Alignment.centerRight,
  child: ElevatedButton(
   onPressed: () {
  // Add functionality for the Next button
  Navigator.pop(context); // Close the first dialog
  ISBNPopupDialog1.show(context); // Show the second dialog
},

    style: ElevatedButton.styleFrom(
      foregroundColor: const Color(0xFFE6864E), backgroundColor: Colors.white,
      side: const BorderSide(
        color: Color(0xFFE6864E),
      ),
    ),
    child: const Text('Next'),
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
}
