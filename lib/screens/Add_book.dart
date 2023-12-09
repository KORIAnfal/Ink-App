import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Add_book_post.dart';

class Add_book extends StatefulWidget {
  const Add_book({Key? key}) : super(key: key);
  @override
  _Add_bookState createState() => _Add_bookState();
}

double screenHeight = 0;
double screenWidth = 0;

class _Add_bookState extends State<Add_book> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
            debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      // Handle back button press
                      Navigator.pop(context); // This line will navigate back
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                SizedBox(width: screenWidth * 0.22),
                const Text(
                  'Add Book',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: screenWidth * 0.18),
                GestureDetector(
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFE16A3D)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Add_book_post(imageFile: file),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          toolbarHeight: 80,
          backgroundColor: Colors.white,
        ),
        body: Column(children: [
          Stack(children: [
            Container(
              height: screenHeight * 0.8576,
              width: double.infinity,
              color: const Color(0xFFFDE3CE),
              child: file == null
                  ? Image.asset(
                      'assets/images/add-image.png',
                      width: 70,
                      height: 70,
                    )
                  : Image.file(
                      file!,
                      //fit: BoxFit.fill,
                    ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Row(children: [
                SizedBox(
                  width: screenWidth * 0.03,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo,
                      color: Color(0xFFE16A3D),
                      size: 30,
                    ),
                    onPressed: () {
                      getgallery();
                    },
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.40,
                ),
                Container(
                  width: 80.0, // Adjust the width and height as needed
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: Color(0xFFE16A3D),
                      size: 30,
                    ),
                    onPressed: () {
                      getcamera();
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.2,
                )
              ]),
            ),
          ]),
        ]),
      ),
    );
  }

  getcamera() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
