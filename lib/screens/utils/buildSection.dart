import 'package:flutter/material.dart';
Widget _buildSection(String sectionTitle, List<String> books) {
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
      _buildBookRow(books.sublist(0, 3)),
      const SizedBox(height: 8),
      _buildBookRow(books.sublist(3, 6)),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              // Handle "See All" action for this section
            },
            child: const Text(
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
                margin: const EdgeInsets.only(right: 8),
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

