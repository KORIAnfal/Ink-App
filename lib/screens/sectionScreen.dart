import 'package:flutter/material.dart';
import 'UserMain.dart';
import 'Guest_Account.dart';
import 'BookDetailsUser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/custom_bottom_navigation_bar.dart';


class SingleSectionScreen extends StatelessWidget {
  final String sectionTitle;
  final Map<String, List<dynamic>> sectionData;

  const SingleSectionScreen({
    required this.sectionTitle,
    required this.sectionData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> books = sectionData['books']!.cast<String>();
    List<bool> booksWithSpecialIcons = sectionData['icons']!.cast<bool>();

    return Scaffold(
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
              _buildSection(sectionTitle, books, booksWithSpecialIcons, context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

Widget _buildSection(
  String sectionTitle, List<String> bookPaths, List<bool> booksWithSpecialIcons, BuildContext context) {
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
      const SizedBox(height: 8),
            bookPaths.isEmpty
          ? Column(
              children: [
                Image.asset(
                  'assets/images/empty.png', // Replace with the path to your no books image
                  height: 400, // Adjust the height as needed
                  width: 400, // Adjust the width as needed
                ),
                    const Text(
                      "No available Books",
                      style: TextStyle(fontSize: 16, color: Color(0xFF545454)),
                    ),
                    const Text(
                      "in this category",
                      style: TextStyle(fontSize: 16, color: Color(0xFF545454)),
                    ),
              ],
            )
          : _buildBookGrid(bookPaths, booksWithSpecialIcons, context),
    ],
  );
}


Widget _buildBookGrid(
  List<String> bookPaths, List<bool> booksWithSpecialIcons, BuildContext context) {
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
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsUserScreen(bookPath: bookPaths[entry.key]),
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
                        height: 150, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
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



}
