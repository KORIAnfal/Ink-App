import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/sellerCard.dart';
import 'Guest_Account.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';


// Rest of the code...

class BookDetailsUserScreen extends StatefulWidget {
  final String bookId;

  const BookDetailsUserScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  _BookDetailsUserScreenState createState() => _BookDetailsUserScreenState();
}
class _BookDetailsUserScreenState extends State<BookDetailsUserScreen> {
  late Future<Map<String, dynamic>> bookDetails;

  @override
  void initState() {
    super.initState();
    bookDetails = fetchBookDetails();

  }

 Future<Map<String, dynamic>> fetchBookDetails() async {
  print('the id is ${widget.bookId}');
  final response = await http.get(Uri.parse('https://inkapp.vercel.app/getBookDetails/${widget.bookId}'));

  if (response.statusCode == 200) {
    // Print the response before decoding
    //print("Response Before Decoding: ${response.body}");

    // Parse the JSON
    final decodedResponse = jsonDecode(response.body);

    // Print the decoded response
    //print("Decoded Response: $decodedResponse");

    return decodedResponse;
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load book details');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Handle back button press
            Navigator.pop(context); // This line will navigate back
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.black,
            iconSize: 30, // Set the size of the profile icon
            onPressed: () {
               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Guest_Account()),
                          );             },
          ),
        ],
      ),


      body: FutureBuilder<Map<String, dynamic>>(
        future: bookDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Assuming your API returns a Map with keys 'book', 'sellerbook', and 'sellers'
            final book = snapshot.data!['book'] as Map<String, dynamic>;
            final sellers = snapshot.data!['sellers'] as List<dynamic>;

            // Extract seller books from each seller
            final List<Map<String, dynamic>> sellerBook = sellers.map<Map<String, dynamic>>((sellerInfo) => sellerInfo['seller_book'] as Map<String, dynamic>).toList();

            // Extract sellers as maps
            final List<Map<String, dynamic>> seller = sellers.map<Map<String, dynamic>>((sellerInfo) => sellerInfo['seller'] as Map<String, dynamic>).toList();



            // Print the results for verification
            //print("Book Details: $book");
            //print("Seller Book List: $sellerBook");
            //print("Sellers: $seller");


            return _buildBookDetailsContent(book, sellerBook, seller,sellers);
          }
        },
      ),

           bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

Widget _buildBookDetailsContent(Map<String, dynamic> book, List<dynamic> sellerBook, List<dynamic> seller, List<dynamic> sellers) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: 'https://mqlvalzpuinscoobhwmc.supabase.co/storage/v1/object/public/${book['imagepath']}',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                height: 210, // Set the height as needed
                width: 160, // Set the width as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            book['title'], // Access 'title' from the 'book' Map
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            book['authors'], // Access 'author' from the 'book' Map
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 5.0), // Adjust the left padding as needed
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
              book['summary'], // Access 'summary' from the 'book' Map
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 5.0), // Adjust the left padding as needed
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
         ...sellers.map((sellerInfo) {
  print("Seller Info: ${sellerInfo['seller']}");
  print("Seller Book Info: ${sellerInfo['seller_book']}");
  return _buildSellerCard(sellerInfo['seller'], sellerInfo['seller_book']);
}).toList(),

        ],
      ),
    ),
  );
}

Widget _buildSellerCard(Map<String, dynamic> seller,Map<String, dynamic> sellerbook) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: SellerCard(
      sellerName: seller['accountname'], // Access 'name' from the 'seller' Map
      bookStatus: sellerbook['sell'] == 1 ? 'For Sell' : 'For Exchange',
      price: sellerbook['price'], // Access 'price' from the 'seller' Map
      isDeliveryAvailable: sellerbook['delivery'], // Access 'isDeliveryAvailable' from the 'seller' Map
      instagram: seller['insta'], // Access 'instagramLink' from the 'seller' Map
      email: seller['email'], // Access 'email' from the 'seller' Map
      phoneNumber: seller['phonenumber'], // Access 'phoneNumber' from the 'seller' Map
      location: seller['wilaya'], // Access 'location' from the 'seller' Map
      sellerProfileImagePath: seller['imagepath'], // Access 'profileImagePath' from the 'seller' Map
    ),
  );
}


  
}