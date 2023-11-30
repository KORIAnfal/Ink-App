import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'utils/user.dart';




class EditAccountScreen extends StatefulWidget {
  final User user;

  EditAccountScreen({Key? key, required this.user}) : super(key: key);

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

  List<String> wilayas = ['Wilaya 1', 'Wilaya 2', 'Wilaya 3'];
  List<String> regions = ['Region 1', 'Region 2', 'Region 3'];

  String selectedWilaya = 'Wilaya 1';
  String selectedRegion = 'Region 1';

  PickedFile? pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);

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
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: pickedImage != null
                            ? FileImage(File(pickedImage!.path))
                                as ImageProvider<Object>?
                            : AssetImage('assets/images/user_male.png'),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Text(
                        'Change Profile Photo',
                        style: TextStyle(
                          color: Color(0xFFE16A3D),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
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
                SizedBox(height: 16.0),
                _buildLinksRectangle(),
                SizedBox(height: 16.0),
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
                              return BorderSide(color: Color(0xFFE16A3D));
                            },
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xFFE16A3D)),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _validateAndSaveChanges,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color(0xFFE16A3D);
                              }
                              return Color(0xFFE16A3D);
                            },
                          ),
                        ),
                        child: Text('Save Changes'),
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
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
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
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: label,
              suffixIcon: Icon(icon, color: Color(0xFFE16A3D)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksRectangle() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media Links',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: instagramLinkController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
              ),
              hintText: 'Add Instagram Link',
              suffixIcon: Icon(Icons.link, color: Color(0xFFE16A3D)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
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
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xFFE16A3D)),
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
              padding: EdgeInsets.all(16.0),
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
                  SizedBox(height: 16.0),
                  Icon(Icons.check_circle, color: Colors.green, size: 40.0),
                  SizedBox(height: 16.0),
                  Text(
                    'Changes Saved Successfully',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE16A3D),
                    ),
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
