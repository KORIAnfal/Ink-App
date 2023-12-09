import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class SellerCard extends StatelessWidget {
  final String sellerName;
  final String bookStatus;
  final double price;
  final bool isDeliveryAvailable;
  final String instagram;
  final String email;
  final String phoneNumber;
  final String location;
  final String sellerProfileImagePath; // New addition

  const SellerCard({Key? key, 
    required this.sellerName,
    required this.bookStatus,
    required this.price,
    required this.isDeliveryAvailable,
    required this.instagram,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.sellerProfileImagePath, // New addition
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0), // Adjust the margin as needed
       decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: _buildFrontSide(),
        back: _buildBackSide(),
      ),
    );
  }

  Widget _buildFrontSide() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(sellerProfileImagePath),
              ),
          // Left side - Profile photo and seller's info
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              sellerName,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // You can change the color as needed
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              bookStatus,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black, // You can change the color as needed
              ),
            ),
            Text(
              '$price DA',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFFE16A3D), // You can change the color as needed
              ),
            ),
            
            Text(
              isDeliveryAvailable ? 'Dilevery is Available' : 'Dilevery is not available',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black, // You can change the colors as needed
              ),
),

              // Top right - Arrow icon
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackSide() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top left - Arrow icon to flip bac
          // Additional contact information
          Text(
              sellerName,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // You can change the color as needed
              ),
            ),
          // Add icons and contact information
          _buildContactInfo( 'assets/images/instagram.png', instagram),
          _buildContactInfo( 'assets/images/email.png', email),
          _buildContactInfo( 'assets/images/call.png', phoneNumber),
          _buildContactInfo( 'assets/images/location.png', location),
        ],
      ),
    );
  }

Widget _buildContactInfo(String iconPath, String contactInfo) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0), // Adjust the left padding as needed
    child: Row(
      children: [
        Image.asset(iconPath, height: 20.0, width: 20.0),
        const SizedBox(width: 8.0),
        Text(' $contactInfo'),
      ],
    ),
  );
}


}
