class Seller {
  final int id; // Add this line
  final String name;
  final String accountName;
  final String profileImagePath;
  final String instagramLink;
  final String email;
  final String phoneNumber;
  final String location;

  Seller({
    required this.id, // Add this line
    required this.name,
    required this.accountName,
    required this.profileImagePath,
    required this.instagramLink,
    required this.email,
    required this.phoneNumber,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add this line
      'name': name,
      'accountName': accountName,
      'profileImagePath': profileImagePath,
      'instagramLink': instagramLink,
      'email': email,
      'phoneNumber': phoneNumber,
      'location': location,
    };
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'], // Add this line
      name: map['name'],
      accountName: map['accountName'],
      profileImagePath: map['profileImagePath'],
      instagramLink: map['instagramLink'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      location: map['location'],
    );
  }
}
