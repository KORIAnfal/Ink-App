import 'package:flutter/material.dart';
import 'utils/CustomAppBar.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ExploreByCategory extends StatelessWidget {
  ExploreByCategory({Key? key}) : super(key: key);

  // Predefined list of categories with name and image path
  final List<Map<String, String>> categoriesList = [
    {'name': 'Adventure', 'imagePath': 'assets/images/category.png'},
    {'name': 'Mystery', 'imagePath': 'assets/images/category.png'},
    {'name': 'Crime', 'imagePath': 'assets/images/category.png'},
    {'name': 'Historical', 'imagePath': 'assets/images/category.png'},
    {'name': 'Horror', 'imagePath': 'assets/images/category.png'},
    {'name': 'Classics', 'imagePath': 'assets/images/category.png'},
    {'name': 'Science fiction', 'imagePath': 'assets/images/category.png'},
    {'name': 'Action', 'imagePath': 'assets/images/category.png'},
    {'name': 'Romance', 'imagePath': 'assets/images/category.png'},
    {'name': 'Fantasy', 'imagePath': 'assets/images/category.png'},
    {'name': 'Young Adult (YA) Fiction', 'imagePath': 'assets/images/category.png'},
    {'name': 'Art and Architecture', 'imagePath': 'assets/images/category.png'},
    {'name': 'Biography', 'imagePath': 'assets/images/category.png'},
    {'name': 'Biology', 'imagePath': 'assets/images/category.png'},
    {'name': 'Law', 'imagePath': 'assets/images/category.png'},
    {'name': 'Philosophy', 'imagePath': 'assets/images/category.png'},
    {'name': 'Business and economics', 'imagePath': 'assets/images/category.png'},
    {'name': 'Cookbooks and Food', 'imagePath': 'assets/images/category.png'},
    {'name': 'Health', 'imagePath': 'assets/images/category.png'},
    {'name': 'Mathematics', 'imagePath': 'assets/images/category.png'},
    {'name': 'Language Arts and Writing', 'imagePath': 'assets/images/category.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child:  CustomAppBar(
            userName: '',
        
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Explore by Category',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              // Display list of categories in a GridView with 2 columns
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return _buildCategory(context, categoriesList[index]);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }

  // Function to build each category
Widget _buildCategory(BuildContext context, Map<String, String> category) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          category['imagePath']!,
        ),
      ),
      Positioned(
        
        left: 0,
        right: 0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category['name']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
  );
}




}
