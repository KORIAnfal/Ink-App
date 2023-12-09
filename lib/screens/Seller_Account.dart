import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'UserMain.dart';
import 'BookDetailsSeller.dart';
import 'GeneralSettings.dart';

import 'utils/user.dart';

class Book {
  final String imagePath;

  Book({required this.imagePath});
}

class SellerAccount extends StatelessWidget {
  bool isSignedUp = false; // Set to true if the user is signed up

  final User user = User(
    name: 'Iqraa Library',
    location: 'Oran',
    phoneNumber: '0634567893',
    email: 'sara.email@example.com',
    instagramAccount: 'Iqraa-dz',
  );

  final List<Book> booksRow1 = [
    Book(imagePath: '3.jpg'),
    Book(imagePath: '4.jpg'),
    Book(imagePath: '6.jpg'),
    // Add more books as needed
  ];

  final List<Book> booksRow2 = [
    Book(imagePath: '1.jpg'),
    Book(imagePath: '2.jpg'),
    Book(imagePath: '5.jpg'),
    // Add more books as needed
  ];

  SellerAccount({Key? key}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
        title: Center(
          child: Text(
            user.name,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black,
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GeneralSettings(user: user)),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUserProfileSection(user),
            const SizedBox(height: 40.0),
            booksRow1.isEmpty && booksRow2.isEmpty
                ? Column(
              children: [
                Image.asset(
                  'assets/images/empty.png', // Replace with the path to your no books image
                  height: 300, // Adjust the height as needed
                  width: 400, // Adjust the width as needed
                ),
                    const Text(
                      "No available Books",
                      style: TextStyle(fontSize: 16, color: Color(0xFF545454)),
                    ),
                    const Text(
                      "in this account",
                      style: TextStyle(fontSize: 16, color: Color(0xFF545454)),
                    ),
                     const SizedBox(height: 50.0),

              ],
            )
                : Column(
                    children: [
                      buildBookImagesContainer(booksRow1,context),
                      const SizedBox(height: 20.0),
                      buildBookImagesContainer(booksRow2,context),
                    ],
                  ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildUserProfileSection(User user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/profile.png',
                height: 150.0,
                width: 150.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          buildVagueUserInfoRow(
            'assets/images/location1.png',
            user.location,
            isSignedUp,
          ),
          buildVagueUserInfoRow(
            'assets/images/call1.png',
            user.phoneNumber,
            isSignedUp,
          ),
          buildVagueUserInfoRow(
            'assets/images/email1.png',
            user.email,
            isSignedUp,
          ),
          buildVagueUserInfoRow(
            'assets/images/instagram1.png',
            user.instagramAccount,
            isSignedUp,
          ),
        ],
      ),
    );
  }

  Widget buildVagueUserInfoRow(
    String iconPath,
    String text,
    bool isSignedUp,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

 Widget buildBookImagesContainer(List<Book> books, BuildContext context) {
  if (books.isEmpty) {
    return const Center(
      child: Text(
        'No books available.',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: books
          .map(
            (book) => GestureDetector(
              onTap: () {
                // Navigate to BookDetailsSellerScreen when a book is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsSellerScreen(
                      bookPath: book.imagePath,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 40) / 3.1, // Adjust the width for three books in a row
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/${book.imagePath}',
                    height: 122.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}

}
