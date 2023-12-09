import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'sectionScreen.dart';
import 'BookDetailsUser.dart';
import 'Guest_Account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Map sections = {
  "Religion": {
    "books": ["3.jpg", "1.jpg", "2.jpg", "4.jpg",  "6.jpg","5.jpg", "2.jpg", "4.jpg"],
    "icons": [true, false, true, false, true, false, true, false, true],
  },
  "Social": {
    "books": ["4.jpg", "5.jpg"],
    "icons": [false, true, false, true, false, true],
  },
  "Law": {
    "books": [],
    "icons": [],
  },
  "Art": {
    "books": ["4.jpg", "6.jpg", "3.jpg", "1.jpg", "5.jpg"],
    "icons": [false, true, false, true, false],
  },
  // Add more sections as needed...
};

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset(
              'assets/images/ink-logo-black-01.png',
              width: 60,
              height: 80,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Guest_Account()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSection2("Ads", ["7.jpg", "8.jpg", "9.jpg"]),
                const SizedBox(height: 20),
                for (var entry in sections.entries)
                  _buildSection(
                    entry.key,
                    entry.value['books']!.take(6).toList(),
                    entry.value['icons']!.take(6).toList(),
                    context,
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }

Widget _buildSection(String sectionTitle, List<dynamic> books, List<dynamic> booksWithSpecialIcons, BuildContext context) {
  final int itemCount = books.length;

  // Convert dynamic lists to the desired types
  List<String> bookPaths = books.cast<String>();
  List<bool> specialIcons = booksWithSpecialIcons.cast<bool>();

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildBookRow(bookPaths, specialIcons, context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleSectionScreen(
                      sectionTitle: sectionTitle,
                      sectionData: {'books': bookPaths, 'icons': specialIcons},
                    ),
                  ),
                );
              },
              child: const Text(
                "See All",
                style: TextStyle(color: Color(0xFFE16A3D)),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget _buildBookRow(List<String> bookPaths, List<bool> booksWithSpecialIcons, BuildContext context) {
  return Wrap(
    spacing: 8.0,
    runSpacing: 8.0,
    children: bookPaths
        .asMap()
        .entries
        .map(
          (entry) => Flexible(
            child: GestureDetector(
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsUserScreen(
                      bookPath: bookPaths[entry.key],
                    ),
                  ),
                );*/
              },
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 40) / 3.1, // Set the width for three books in a row
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/${bookPaths[entry.key]}',
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right:8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: booksWithSpecialIcons[entry.key]
                            ? const FaIcon(
                                FontAwesomeIcons.exchangeAlt,
                                size: 13,
                                color: Color(0xFFE16A3D),
                              )
                            : const FaIcon(
                                FontAwesomeIcons.tag,
                                size: 13,
                                color: Colors.green,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList(),
  );
}



  Widget _buildSection2(String sectionTitle, List<String> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 160, // Set the height based on your desired book image size
          child: PageView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return _buildBookRow2([books[index]]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookRow2(List<String> bookPaths) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: bookPaths
          .map(
            (bookPath) => Expanded(
              child: GestureDetector(
                onTap: () {
                  // Handle tap on the book cover
                  print("Tapped on $bookPath");
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                    child: Image.asset(
                      'assets/images/$bookPath', // Update the path as needed
                      height: 140, // Adjust the height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
