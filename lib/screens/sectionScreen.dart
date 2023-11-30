import 'package:flutter/material.dart';
import 'UserMain.dart';
import 'Guest_Account.dart';
import 'BookDetailsUser.dart';

import 'utils/custom_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';


class SingleSectionScreen extends StatelessWidget {
  final String sectionTitle;
  final Map<String, List<dynamic>>
      sectionData; // Updated to accept the entire map

  const SingleSectionScreen({
    required this.sectionTitle,
    required this.sectionData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.black,
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Guest_Account()),
                          );            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(sectionTitle, sectionData,context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildSection(
      String sectionTitle, Map<String, List<dynamic>> sectionData,BuildContext context) {
    List<String> books = sectionData['books']!.cast<String>();
    List<bool> booksWithSpecialIcons = sectionData['icons']!.cast<bool>();

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
        _buildBookRow(books, booksWithSpecialIcons,context),
      ],
    );
  }

  // ... (rest of your code remains the same)
  Widget _buildBookRow(
      List<String> bookPaths, List<bool> booksWithSpecialIcons, BuildContext context) {
    List<Widget> rows = [];

    for (int i = 0; i < bookPaths.length; i += 3) {
      List<String> currentRowPaths = bookPaths.sublist(i, i + 3);
      List<bool> currentRowIcons = booksWithSpecialIcons.sublist(i, i + 3);

      rows.add(_buildBookRowSegment(currentRowPaths, currentRowIcons, context));
      rows.add(SizedBox(height: 8)); // Add some vertical spacing
    }

    return Column(
      children: rows,
    );
  }

  Widget _buildBookRowSegment(
      List<String> bookPaths, List<bool> booksWithSpecialIcons, BuildContext context) {
  // Display only the first 6 books if there are more than 6) {
  List<String> displayedBooks = bookPaths.length > 6 ? bookPaths.sublist(0, 6) : bookPaths;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: displayedBooks
        .asMap()
        .entries
        .map(
          (entry) => Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to BookDetailsPage when a book is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsUserScreen (bookPath: displayedBooks[entry.key]),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/${displayedBooks[entry.key]}',
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: booksWithSpecialIcons[entry.key]
                            ? const Icon(
                                Icons.airplane_ticket_outlined,
                                color: Colors.orangeAccent,
                                size: 16,
                              )
                            : const Icon(
                                Icons.currency_exchange_rounded,
                                color: Colors.green,
                                size: 16,
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
