import 'dart:io';
import 'package:flutter/material.dart';
import 'Seller_Account.dart' as SellerAccount;



class Add_book_post extends StatefulWidget {
  final File? imageFile;
  const Add_book_post({Key? key, required this.imageFile}) : super(key: key);
  @override
  _Add_book_postState createState() => _Add_book_postState();
}

double screenHeight = 0;
double screenWidth = 0;

class _Add_book_postState extends State<Add_book_post> {
  Set<int> selectedButtoncategoryRow1 = {};
  Set<int> selectedButtoncategoryRow2 = {};
  Set<int> selectedTypeRow = {};
  bool showPrice = false;

  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  TextEditingController priceController = TextEditingController();

  List<String> inputs = [];
  List<String> ButtonText = [
    'Career',
    'Scholar',
    'Sci-Fi',
    'Biology',
    'Comedy',
  ];
  List<String> PostType = ['Sell', 'Exchange'];

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
                onTap: () {
                  inputs =
                      controllers.map((controller) => controller.text).toList();
                  print(inputs);
                  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SellerAccount.SellerAccount()),
                          );
                          


                },
                child: const Text(
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
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.3,
                    child: widget.imageFile != null
                        ? Image.file(
                            widget.imageFile!,
                            fit: BoxFit.fill,
                          )
                        : const Center(
                            child: Text('No Image Selected'),
                          )),
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
                    controller: controllers[0],
                    decoration: const InputDecoration(
                      labelText: 'Book Title:',
                    ),
                  ),
                  TextField(
                    controller: controllers[1],
                    decoration: const InputDecoration(
                      labelText: 'Author:',
                    ),
                  ),
                  TextField(
                    controller: controllers[2],
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
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
                const Text(
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
                          selectedButtoncategoryRow1)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      1,
                      (index) => buildButton(index, ButtonText[index + 4],
                          selectedButtoncategoryRow2)),
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
                            index, PostType[index], selectedTypeRow)),
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
}
