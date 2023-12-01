import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                SizedBox(width: screenWidth * 0.22),
                Text(
                  'Add Book',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      color: Colors.black,
                      ),
                ),
                SizedBox(width: screenWidth * 0.2),
               GestureDetector(
                child:Text(
                  'Next',
                  style: TextStyle(
                    
                      fontWeight: FontWeight.bold, 
                      color:Color(0xFFE16A3D)
                      ),
                ),
                onTap: (){
                  
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
              height: screenHeight * 0.868,
              width: double.infinity,
              color: Color(0xFFFDE3CE),
              child: file == null
                  ? Image.asset(
                      'assets/images/add-image.png', 
                      width: 50, 
                      height: 50, 
                    )
                  : Image.file(
                      file!,
                      //fit: BoxFit.fill,
                    ),
            ),
            Positioned(
              bottom: 16.0, // Adjust the bottom margin as needed
              left: 16.0, // Adjust the left margin as needed
              right: 16.0,
              child: Row(children: [
                SizedBox(
                  width: screenWidth * 0.03,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.photo,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {
                      getgallery();
                    },
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.4,
                ),
                Container(
                  width: 80.0, // Adjust the width and height as needed
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {
                      getcamera();
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
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
