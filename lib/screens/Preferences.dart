import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Preferencescreen extends StatefulWidget {
  const Preferencescreen({Key? key}) : super(key: key);

  @override
  _PreferencescreenState createState() => _PreferencescreenState();
}

class _PreferencescreenState extends State<Preferencescreen> {
  List<String> selectedSubcategories = []; // Track selected subcategories

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Align(
              alignment: Alignment(0.9, -0.9),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xFF656363),
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Preferences',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Choose what you most like ',
                    style: TextStyle(color: Color(0xFF505050), fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'to personalize your experience',
                    style: TextStyle(color: Color(0xFF505050), fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Fiction',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SubcategoryButton(
                        label: 'Adventure',
                        isSelected: selectedSubcategories.contains('Adventure'),
                        onTap: () => toggleSubcategory('Adventure'),
                      ),
                      const SizedBox(width: 5),
                      SubcategoryButton(
                        label: 'Mystery',
                        isSelected: selectedSubcategories.contains('Mystery'),
                        onTap: () => toggleSubcategory('Mystery'),
                      ),
                      const SizedBox(width: 5),
                      SubcategoryButton(
                        label: 'Crime',
                        isSelected: selectedSubcategories.contains('Crime'),
                        onTap: () => toggleSubcategory('Crime'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5 , height: 10),
                  Row(
                    children: [
                      SubcategoryButton(
                        label: 'Horror',
                        isSelected: selectedSubcategories.contains('Horror'),
                        onTap: () => toggleSubcategory('Horror'),
                      ),
                      const SizedBox(width: 5),
                      SubcategoryButton(
                        label: 'Classics',
                        isSelected: selectedSubcategories.contains('Classics'),
                        onTap: () => toggleSubcategory('Classics'),
                      ),
                      const SizedBox(width: 5),
                      SubcategoryButton(
                        label: 'Science fiction',
                        isSelected: selectedSubcategories.contains('Science fiction'),
                        onTap: () => toggleSubcategory('Science fiction'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5 , height: 10),
                  Row(
                    children: [
                      SubcategoryButton(
                        label: 'Historical',
                        isSelected: selectedSubcategories.contains('Historical'),
                        onTap: () => toggleSubcategory('Historical'),
                      ),
                      const SizedBox(width: 5),
                      SubcategoryButton(
                        label: 'Romance',
                        isSelected: selectedSubcategories.contains('Romance'),
                        onTap: () => toggleSubcategory('Romance'),
                      ),
                      const SizedBox(width: 5),
                      SubcategoryButton(
                        label: 'Fantasy',
                        isSelected: selectedSubcategories.contains('Fantasy'),
                        onTap: () => toggleSubcategory('Fantasy'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5 , height: 10),
                  Row(
                    children: [
                      SubcategoryButton(
                        label: 'Action',
                        isSelected: selectedSubcategories.contains('Action'),
                        onTap: () => toggleSubcategory('Action'),
                      ),
                    ],
                  ),
                  // Display a message if more than 5 subcategories are selected
                  if (selectedSubcategories.length > 5)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'You can select up to 5 subcategories.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleSubcategory(String subcategory) {
    setState(() {
      if (selectedSubcategories.contains(subcategory)) {
        selectedSubcategories.remove(subcategory);
      } else {
        if (selectedSubcategories.length < 5) {
          selectedSubcategories.add(subcategory);
        } else {
          showToast('You can select up to 5 subcategories.');
        }
      }
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class SubcategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SubcategoryButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE16A3D) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: Colors.white, width: 1.0) : Border.all(color: Colors.black, width: 1.0) ,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
