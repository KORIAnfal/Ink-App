import 'book.dart';
import 'seller.dart';

class Selling {
  final int id; // Add this line
  final Book book;
  final Seller seller;
  final double price;
  final bool isDeliveryAvailable;
  final bool isForSell;
  final bool isForExchange;

  Selling({
    required this.id, // Add this line
    required this.book,
    required this.seller,
    required this.price,
    required this.isDeliveryAvailable,
    required this.isForSell,
    required this.isForExchange,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add this line
      'bookId': book.id, // Assuming Book class has an 'id' field
      'sellerId': seller.id, // Assuming Seller class has an 'id' field
      'price': price,
      'isDeliveryAvailable': isDeliveryAvailable ? 1 : 0,
      'isForSell': isForSell ? 1 : 0,
      'isForExchange': isForExchange ? 1 : 0,
    };
  }

  factory Selling.fromMap(Map<String, dynamic> map) {
    return Selling(
      id: map['id'], // Add this line
      book: Book(id: map['bookId'], title: '', author: '', summary: '', imagePath: '', isbn: 0), // Assuming Book class has an 'id' field
      seller: Seller(id: map['sellerId'], name: '', accountName: '', profileImagePath: '', instagramLink: '', email: '', phoneNumber: '', location: ''), // Assuming Seller class has an 'id' field
      price: map['price'],
      isDeliveryAvailable: map['isDeliveryAvailable'] == 1,
      isForSell: map['isForSell'] == 1,
      isForExchange: map['isForExchange'] == 1,
    );
  }
}
