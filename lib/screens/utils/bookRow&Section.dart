import 'package:flutter/material.dart';


class bookRow_section extends StatelessWidget {
  const bookRow_section({Key? key}) : super(key: key);



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
        _buildBookRow(books),
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

  Widget _buildBookRow(List<String> bookPaths) {
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
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/$bookPath',
                      height: 150,
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
  
  @override
  Widget build(BuildContext context) {
   
    throw UnimplementedError();
  }
}
