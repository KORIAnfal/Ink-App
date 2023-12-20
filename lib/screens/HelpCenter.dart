import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildExpandableQuestion(
                  'What is Ink?', 'Ink is your ultimate hub for buying and exchanging books effortlessly. Our user-friendly platform ensures a seamless experience, allowing you to explore, purchase, and swap books with ease. Elevate your reading journey with Ink, your doorway to a world of books at your fingertips.'),
              const SizedBox(height: 16.0),
              _buildExpandableQuestion(
                  'How to add a book?', 'To add a book on Ink, start by creating an account. Once logged in, hit the plus button. Capture a photo of your book or select one from your gallery. Fill in the necessary details about the book, and you are all set to post it for others to discover and potentially exchange. Happy sharing!'),
              const SizedBox(height: 16.0),
              _buildExpandableQuestion(
                  'How to delete my account?', 'Deleting your account is permanent'),
              const SizedBox(height: 16.0),
              _buildContactUs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableQuestion(String question, String answer) {
    return _buildContainer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              question,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          tilePadding: EdgeInsets.zero,
          collapsedTextColor: Colors.black,
          iconColor: Colors.black,
          textColor: Colors.black,
          collapsedIconColor: Colors.black,
          backgroundColor: Colors.transparent,
          onExpansionChanged: (bool expanded) {},
          children: [
            const Divider(height: 1, color: Colors.grey), // Divider
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(answer),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactUs() {
    return _buildContainer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1, color: Colors.grey), // Divider
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactInfo(
                    icon: FontAwesomeIcons.envelope,
                    value: 'ink.ia.23@gmail.com',
                  ),
                  _buildContactInfo(
                    icon: FontAwesomeIcons.facebook,
                    value: 'Ink_Books',
                  ),
                  _buildContactInfo(
                    icon: FontAwesomeIcons.instagram,
                    value: 'Ink_Books',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo({required IconData icon, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          FaIcon(icon),
          const SizedBox(width: 8.0),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildContainer({required Widget child}) 
  {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: child,
    ) ;
  }
} 
