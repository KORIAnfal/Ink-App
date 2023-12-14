class Seller {
  final int id; // Add this line
  final String accountName;
  final String profileImagePath;
  final String instagramLink;
  final String FaceBookLink;
  final String email;
  final String phoneNumber;
  final String wilaya;
  final String region;
  final String password;

  Seller({
    required this.id, // Add this line
    required this.accountName,
    required this.profileImagePath,
    required this.instagramLink,
    required this.FaceBookLink,
    required this.email,
    required this.phoneNumber,
    required this.wilaya,
    required this.region,
    required this.password,



  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add this line
      'accountName': accountName,
      'profileImagePath': profileImagePath,
      'instagramLink': instagramLink,
      'facebookLink': FaceBookLink,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'wilaya': wilaya,
      'region': region,


    };
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'], // Add this line
      accountName: map['accountName'],
      profileImagePath: map['profileImagePath'],
      instagramLink: map['instagramLink'],
      FaceBookLink: map['FaceBookLink'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      wilaya: map['wilaya'],
      region: map['region'],
      password: map['password'],


    );
  }
}
