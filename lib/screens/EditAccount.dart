import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'utils/user.dart';
import 'Seller_Account1.dart' as SellerAccount1;


class EditAccountScreen extends StatefulWidget {
  final User user;

   const EditAccountScreen({Key? key, required this.user}) : super(key: key);

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController instagramLinkController = TextEditingController();

  List<String> wilayas = ['Oran', 'Algries', 'Annaba'];
  List<String> regions = ['Region 1', 'Region 2', 'Region 3'];

  String selectedWilaya = 'Oran';
  String selectedRegion = 'Region 1';

  PickedFile? pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final PickedFile? image =
        await picker.getImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = image;
    });
  }

  @override
  void initState() {
    super.initState();
    // Populate the form fields with the existing user information
    nameController.text = widget.user.name;
    locationController.text = widget.user.location;
    phoneController.text = widget.user.phoneNumber;
    emailController.text = widget.user.email;
    instagramLinkController.text = widget.user.instagramAccount;
    // Initialize other controllers based on user data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: pickedImage != null
                            ? FileImage(File(pickedImage!.path))
                                as ImageProvider<Object>?
                            : const AssetImage('assets/images/profile.png'),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: _pickImage,
                      child: const Text(
                        'Change Profile Photo',
                        style: TextStyle(
                          color: Color(0xFFE16A3D),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                _buildTextField('Full Name', nameController, Icons.person,
                    isPassword: false, isRequired: true),
                _buildDropdown('Wilaya', wilayas, selectedWilaya),
                _buildDropdown('Region', regions, selectedRegion),
                _buildTextField(
                    'Location', locationController, Icons.location_on,
                    isPassword: false, isRequired: true),
                _buildTextField('Phone Number', phoneController, Icons.phone,
                    isPassword: false,
                    isRequired: true,
                    keyboardType: TextInputType.phone),
                _buildTextField('Email', emailController, Icons.email,
                    isPassword: false, isRequired: true),
                _buildTextField('Password', passwordController, Icons.lock,
                    isPassword: true, isRequired: true),
                const SizedBox(height: 16.0),
                _buildLinksRectangle(),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return Colors.white;
                            },
                          ),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                            (Set<MaterialState> states) {
                              return const BorderSide(color: Color(0xFFE16A3D));
                            },
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xFFE16A3D)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _validateAndSaveChanges,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color(0xFFE16A3D);
                              }
                              return const Color(0xFFE16A3D);
                            },
                          ),
                        ),
                        child: const Text('Save Changes'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool isPassword = false,
      bool isRequired = false,
      TextInputType? keyboardType}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'This field is required';
              }

              // Additional validation logic...

              return null;
            },
            onChanged: (value) {
              if (label == 'Password') {
                // Handle password onChanged
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: label,
              suffixIcon: Icon(icon, color: const Color(0xFFE16A3D)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksRectangle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Social Media Links',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: instagramLinkController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: 'Add Instagram Link',
              suffixIcon: const Icon(Icons.link, color: Color(0xFFE16A3D)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Color(0xFFE16A3D)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateAndSaveChanges() {
    if (_formKey.currentState!.validate()) {
      _showChangesSavedDialog();
    }
  }

  void _showChangesSavedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/book_edit.png',
                      height: 120.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Icon(Icons.check_circle,
                      color: Colors.green, size: 40.0),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Changes Saved Successfully',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      _navigateToSellerAccountScreen1();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE16A3D),
                    ),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void _navigateToSellerAccountScreen1() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SellerAccount1.SellerAccount1(),
    ),
  );
}
}

