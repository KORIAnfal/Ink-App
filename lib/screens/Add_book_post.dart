import 'package:flutter/material.dart';

class Add_book_post extends StatefulWidget {
  const Add_book_post({Key? key}) : super(key: key);
  @override
  _Add_book_postState createState() => _Add_book_postState();
}

double screenHeight = 0;
double screenWidth = 0;

class _Add_book_postState extends State<Add_book_post> {
  Set<int> selectedButtoncategoryRow1 = {};
  Set<int> selectedButtoncategoryRow2 = {};
  Set<int> selectedTypeRow = {};
  bool showPrice=false;

  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  TextEditingController priceController = TextEditingController();

  List<String> inputs = [];
  List<String> ButtonText = [
    'Action',
    'Error',
    'Sci-Fi',
    'Biology',
    'Comedy',
    'Scholar'
  ];
  List<String> PostType = ['Sell', 'Exchange'];

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
              SizedBox(width: screenWidth * 0.22),
              GestureDetector(
                onTap: () {
                  inputs =
                      controllers.map((controller) => controller.text).toList();
                  print(inputs);
                },
                child: Text(
                  'Post',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFFE16A3D)),
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
                  width: screenWidth * 0.3,
                ),
                Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.3,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  TextField(
                    controller: controllers[0],
                    decoration: InputDecoration(
                      labelText: 'Book Title:',
                    ),
                  ),
                  TextField(
                    controller: controllers[1],
                    decoration: InputDecoration(
                      labelText: 'Author:',
                    ),
                  ),
                  TextField(
                    controller: controllers[2],
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      labelText: 'Description:',
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
                Text(
                  "Book Categories:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      4,
                      (index) => buildButton(index, ButtonText[index],
                          selectedButtoncategoryRow1, false)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      2,
                      (index) => buildButton(index, ButtonText[index + 4],
                          selectedButtoncategoryRow2, false)),
                ),
              ]),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              child: Column(children: [
                Text(
                  "Post Type:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      2,
                      (index) => buildButton(
                          index, PostType[index], selectedTypeRow, true)),
                ),
              ),
              ]),
            ),
           SizedBox(
              height: screenHeight * 0.015,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Price:',
                    ),
                  ),
                  
                ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildButton(int index, String Bottontext,
      Set<int> selectedButtonIndices, bool isType) {
    return Column(
      children: [
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
              if (isType && selectedButtonIndices == 0) {
                showPrice=true;
              }
              print(
                  'Button $index ${selectedButtonIndices.contains(index) ? 'selected' : 'deselected'}');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed) ||
                      selectedButtonIndices.contains(index)) {
                    return Color(0xFFE16A3D);
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
              // Border settings
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

  
}