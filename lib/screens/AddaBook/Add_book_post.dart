import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ink/screens/AddaBook/Add_book.dart';
import 'package:ink/screens/UserMain.dart';
import 'package:ink/screens/utils/bookAdding.dart';
import 'package:ink/screens/Preferences.dart' as Preferences;


import 'package:path_provider/path_provider.dart';

class Add_book_post extends StatefulWidget {
  late final File? imageFile;
  final int? ISBN;

  Add_book_post({Key? key,this.imageFile, required this.ISBN})
      : super(key: key);
  @override
  _Add_book_postState createState() => _Add_book_postState();
}

double screenHeight = 0;
double screenWidth = 0;

class _Add_book_postState extends State<Add_book_post> {
  List<String> selectedPostType = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController authorsController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ISBNController = TextEditingController();

  void initState() {
    
    super.initState();
    ISBNController.text = widget.ISBN.toString(); 
    //fill_page(widget.ISBN!);
  }     
  //    
  // 

   List<String> Categories= [
    'Action','Adveture & Explore','Art & Architecture','Biography','Business','Career & Self improvement','Children','Cooking','Crime','Edication',
  ];
  
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
                  SizedBox(width: screenWidth * 0.15),
                  GestureDetector(
                    onTap: () async {

                      PostBook(widget.imageFile!);
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>MainScreen()),
                      );
                    },
                    child: const Text(
                      'Post',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE16A3D)),
                    ),
                  ),
                ],
              ),
            ),
            toolbarHeight: 80,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.35,
                    ),
                    widget.imageFile != null
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.3,
                            child: Stack(
                              children: [
                                Image.file(
                                  widget.imageFile!,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: InkWell(
                                    onTap: () {
                                      widget.imageFile = null;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.3,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.add_circle_rounded,
                                      size: 64, // Adjust the size as needed
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Add_book(),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(children: [
                      TextField(
                        controller: ISBNController,
                        decoration: const InputDecoration(
                          labelText: 'ISBN:',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE16A3D)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Book Title:',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE16A3D)),
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116)
                              // Change the color conditionally
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: authorsController,
                        decoration: const InputDecoration(
                          labelText: 'Author:',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE16A3D)),
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116)
                              // Change the color conditionally
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: summaryController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: const InputDecoration(
                          labelText: 'Book Summary:',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE16A3D)),
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116)
                              // Change the color conditionally
                              ),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  child: Column(children: [
                    const Text(
                      "Book Categories:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Row(
                      children: [],
                    ),
                  ]),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Container(
                  child: Column(children: [
                    const Text(
                      "Post Type:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 110,
                          ),
                          Preferences.SubcategoryButton(
                            label: ' Sell ',
                            isSelected: selectedPostType.contains(' Sell '),
                            onTap: () => toggleSubcategory(' Sell '),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Preferences.SubcategoryButton(
                            label: ' Exchange ',
                            isSelected: selectedPostType.contains(' Exchange '),
                            onTap: () => toggleSubcategory(' Exchange '),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(children: [
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price:',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE16A3D)),
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116)),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }

  Widget buildButton(
      int index, String Bottontext, Set<int> selectedButtonIndices) {
    return Column(children: [
      Row(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedButtonIndices.contains(index)) {
                  selectedButtonIndices.remove(index);
                } else {
                  selectedButtonIndices.add(index);
                }
              });

              print(
                  'Button $index ${selectedButtonIndices.contains(index) ? 'selected' : 'deselected'}');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed) ||
                      selectedButtonIndices.contains(index)) {
                    return const Color(0xFFE16A3D);
                  } else if (states.contains(MaterialState.hovered)) {
                    return Colors.white;
                  }

                  return Colors.white;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed) ||
                      selectedButtonIndices.contains(index)) {
                    return Colors.white;
                  } else if (states.contains(MaterialState.hovered)) {
                    return Colors.black;
                  }
                  return Colors.black;
                },
              ),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  // Remove the border when pressed or selected
                  if (states.contains(MaterialState.pressed) ||
                      selectedButtonIndices.contains(index)) {
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0));
                  }
                  // Default: Use the default border
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0));
                },
              ),
            ),
            child: Text(Bottontext),
          ),
        ],
      ),
    ]);
  }

  void toggleSubcategory(String subcategory) {
    setState(() {
      if (selectedPostType.contains(subcategory)) {
        selectedPostType.remove(subcategory);
      } else {
        selectedPostType.add(subcategory);
      }
    });
  }

  void PostBook(File imageFile) async {
    AddnewBook(imageFile);
    
  }

  void AddnewBook(File imagefile) async{
    
    //String imagepath= await saveImage(imagefile);
    print(imagefile);
    String result = await Book.addbook({
      'isbn': int.parse(ISBNController.text),
      'title': titleController.text,
      'authors': authorsController.text,
      'summary':summaryController.text,
      'imagepath':imagefile.path,
    
    });
    print('result of addnewbook:${result}');
  }

  Future<String> saveImage(File imageFile) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    
    final String fileName =
        'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final String imagePath = '$appDocPath/$fileName';

    await imageFile.copy(imagePath);

    return imagePath;
  }
  
  bool ISBNexist(int ISBN){
    return true;
  }

  

}
