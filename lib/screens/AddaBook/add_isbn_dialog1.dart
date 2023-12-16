import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'Add_book_post.dart';
class ISBNPopupDialog1 {
  static void show(BuildContext context) {
    TextEditingController manualEntryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ISBNScannerDialog(
          onScanned: (scannedISBN) {
            Navigator.pop(context); 
            if (scannedISBN != null) {
              //_showISBNPopup(context, scannedISBN);
              print(scannedISBN);
            }
          },
          manualEntryController: manualEntryController,
        );
      },
    );
  }

  static void _showISBNPopup(BuildContext context, String isbn) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ISBNResultDialog(isbn: isbn);
      },
    );
  }
}

class ISBNScannerDialog extends StatefulWidget {
  final Function(String?) onScanned;
  final TextEditingController manualEntryController;

  const ISBNScannerDialog({
    super.key,
    required this.onScanned,
    required this.manualEntryController,
  });

  @override
  _ISBNScannerDialogState createState() => _ISBNScannerDialogState();
}

class _ISBNScannerDialogState extends State<ISBNScannerDialog> {
  bool _disposed = false;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }
File? file;
  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
    
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0),
            Text(
              'Enter ISBN number:',
              style: TextStyle(
                color: Colors.grey, // Set the text color to gray
              ),
            ),
            SizedBox(height: 12.0),
            _buildOptionWithInputField(
              icon: Icons.arrow_forward,
              hintText: 'Enter ISBN',
              controller: widget.manualEntryController,
              onTap: () {
                String enteredISBN = widget.manualEntryController.text;
                //widget.onScanned(enteredISBN);
                Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Add_book_post(imageFile: file,ISBN:int.parse(enteredISBN)),
                      ),
                      );
              },
            ),
            const SizedBox(height: 15.0),
            _buildOption(
              icon: Icons.crop_free,
              text: 'Scan the ISBN',
              onTap: () {
                _scanISBN(); // Call the scanning function when tapped
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanISBN() async {
    try {
      final String result = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.DEFAULT,
      );

      if (!_disposed) {
        //widget.onScanned(result);
        String enteredISBN=result;
         Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Add_book_post(imageFile: file,ISBN:int.parse(enteredISBN)),
                      ),
                      );
      }
    } catch (e) {
      print('Error during ISBN scanning: $e');
    }
  }

  Widget _buildOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.0, // Set a fixed height
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE16A3D)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFFE16A3D),
              size: 30.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionWithInputField({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.0, // Set a fixed height
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE16A3D)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFFE16A3D),
              size: 30.0,
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildCenteredText(
    String text,
    Color textColor,
    double fontSize,
    Color shadowColor,
  ) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          shadows: [
            Shadow(
              color: shadowColor,
              blurRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ISBNResultDialog extends StatelessWidget {
  final String isbn;

  const ISBNResultDialog({super.key, required this.isbn});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showISBNPopup(context, isbn);
    });

    return Container();
  }

  void _showISBNPopup(BuildContext context, String isbn) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Book\'s ISBN Code: $isbn',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('OK',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE16A3D),
                  )),
            ),
          ],
        );
      },
    );
  }
}
