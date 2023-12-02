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

class SellerAccount1 extends StatelessWidget {
  bool isSignedUp = false; // Set to true if the user is signed up

  final User user = User(
    name: 'Iqraa Library',
    location: 'Oran',
    phoneNumber: '0634567893',
    email: 'sarabelhadj.email@example.com',
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

  SellerAccount1({Key? key}) : super(key: key);

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
            const SizedBox(height: 20.0),
            booksRow1.isEmpty && booksRow2.isEmpty
                ? const Center(
                    child: Text(
                      'No books available.',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  )
                : Column(
                    children: [
                      buildBookImagesContainer(booksRow1),
                      const SizedBox(height: 20.0),
                      buildBookImagesContainer(booksRow2),
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

  Widget buildBookImagesContainer(List<Book> books) {
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
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to BookDetailsSellerScreen when a book is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsSellerScreen(
                  bookPath: books[index].imagePath,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/images/${books[index].imagePath}',
              height: 122.5,
              width: 100.0,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    ),
  );
}

}
