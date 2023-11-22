import 'package:flutter/material.dart';
import 'utils/CustomAppBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: CustomAppBar(
            userName: 'fffffff ',
            userIconPath: 'assets/images/settings.png', // Replace with the path to your user icon
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSection("Action", ["Book 1", "Book 2", "Book 3", "Book 4", "Book 5", "Book 6"]),
                _buildSection("Horror", ["Book 7", "Book 8", "Book 9", "Book 10", "Book 11", "Book 12"]),
                _buildSection("Mystery", ["Book 13", "Book 14", "Book 15", "Book 16", "Book 17", "Book 18"]),
                _buildSection("Science Fiction", ["Book 19", "Book 20", "Book 21", "Book 22", "Book 23", "Book 24"]),
                // Add more sections as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String sectionTitle, List<String> books) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 8),
      _buildBookRow(books.sublist(0, 3)),
      SizedBox(height: 8),
      _buildBookRow(books.sublist(3, 6)),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              // Handle "See All" action for this section
            },
            child: Text(
              "See All",
              style: TextStyle(color: Color(0xFFE16A3D)),
            ),
          ),
        ],
      ),
    ],
  );
}



  Widget _buildBookRow(List<String> books) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: books
          .map(
            (book) => Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8),
                child: Image.network(
                  // Replace with the actual image URL or asset path for the book cover
                  'https://example.com/book_covers/$book.png',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}


