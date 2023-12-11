import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/sellerCard.dart';
import 'Guest_Account.dart';
import 'package:ink/database/DB_Helper.dart';
import 'package:ink/models/book.dart';
import 'package:ink/models/seller.dart';
import 'package:ink/models/selling.dart';

class BookDetailsUserScreen extends StatelessWidget {
  final int bookId;

  const BookDetailsUserScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  try {
    // existing build logic
  } catch (e) {
    print('Error in build method: $e');
  }
    return FutureBuilder<Book?>(
      future: DBHelper().getBookById(bookId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Book? book = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  // Handle back button press
                  Navigator.pop(context); // This line will navigate back
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
            body: _buildBookDetailsContent(book!),
            bottomNavigationBar: const CustomBottomNavigationBar(),
          );
        } else {
          return const Scaffold(

            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildBookDetailsContent(Book book) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/${book.imagePath}',
                height: 210,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              book.author,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Book summary',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFFE16A3D)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                book.summary,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ),
           const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sellers',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFFE16A3D)),
              ),
            ),
          ),

          const SizedBox(height: 10),
          // Display SellerCards for each seller
          FutureBuilder<List<Selling>>(
            future: DBHelper().getSellingsByBookId(book.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Selling> sellings = snapshot.data!;

                return Column(
                  children: sellings.map((selling) => _buildSellerCard(selling)).toList(),
                );
              } else {
                return const CircularProgressIndicator();

              }
            },
          ),
          ],
        ),
      ),
    );
  }

Widget _buildSellerCard(Selling selling) {
  Seller seller = selling.seller; // Get the seller from the Selling object
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: SellerCard(
      sellerName: seller.name,
      bookStatus: selling.isForSell ? 'For Sell' : 'For Exchange',
      price: selling.price,
      isDeliveryAvailable: selling.isDeliveryAvailable, // Assuming isAvailable is a property of the Selling class
      instagram: seller.instagramLink,
      email: seller.email,
      phoneNumber: seller.phoneNumber,
      location: seller.location,
      sellerProfileImagePath: seller.profileImagePath,
    ),
  );
}

}

