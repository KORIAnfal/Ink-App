import 'package:flutter/material.dart';
import 'utils/CustomAppBar.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CustomAppBar(
          userName: '',
          userIcon: FontAwesomeIcons.cog, 
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(sectionTitle, sectionData),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildSection(
      String sectionTitle, Map<String, List<dynamic>> sectionData) {
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
        _buildBookRow(books, booksWithSpecialIcons),

      ],
    );
  }

  // ... (rest of your code remains the same)
  Widget _buildBookRow(
      List<String> bookPaths, List<bool> booksWithSpecialIcons) {
    List<Widget> rows = [];

    for (int i = 0; i < bookPaths.length; i += 3) {
      List<String> currentRowPaths = bookPaths.sublist(i, i + 3);
      List<bool> currentRowIcons = booksWithSpecialIcons.sublist(i, i + 3);

      rows.add(_buildBookRowSegment(currentRowPaths, currentRowIcons));
      rows.add(SizedBox(height: 8)); // Add some vertical spacing
    }

    return Column(
      children: rows,
    );
  }

  Widget _buildBookRowSegment(
      List<String> bookPaths, List<bool> booksWithSpecialIcons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: bookPaths
          .asMap()
          .entries
          .map(
            (entry) => Expanded(
              child: GestureDetector(
                onTap: () {
                  // Handle tap on the book cover
                  print("Tapped on ${bookPaths[entry.key]}");
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
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