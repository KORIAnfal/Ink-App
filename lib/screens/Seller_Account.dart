import 'package:flutter/material.dart';
import 'package:ink/screens/utils/userAuthentication.dart';

class SellerInfoScreen extends StatefulWidget {
  final String sellerUserId;

  const SellerInfoScreen({Key? key, required this.sellerUserId}) : super(key: key);

  @override
  _SellerInfoScreenState createState() => _SellerInfoScreenState();
}

class _SellerInfoScreenState extends State<SellerInfoScreen> {
  Map<String, dynamic>? sellerInfo;

  @override
  void initState() {
    super.initState();
    fetchSellerInfo();
  }

  Future<void> fetchSellerInfo() async {
    final sellerInfo = await UserAuthentication.getSellerInfo(widget.sellerUserId);

    if (sellerInfo != null) {
      setState(() {
        this.sellerInfo = sellerInfo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Information'),
      ),
      body: sellerInfo == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seller ID: ${sellerInfo!['seller_user_id']}'),
                  Text('Name: ${sellerInfo!['name']}'),
                  Text('Email: ${sellerInfo!['email']}'),
                  // Add other seller information as needed
                ],
              ),
            ),
    );
  }
}