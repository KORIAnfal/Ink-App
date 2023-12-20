import 'package:flutter/material.dart';
import 'package:ink/screens/UserMain.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int selectedOption = -1; // -1 represents no selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    'What is Your Gender?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              GenderOption(
                index: 0,
                selectedOption: selectedOption,
                imagePath: 'assets/images/user_male.png',
                label: 'Male',
                textColor: const Color(0xFF043E52),
                onSelected: () {
                  setState(() {
                    selectedOption = 0;
                  });
                },
              ),
              const SizedBox(height: 60),
              GenderOption(
                index: 1,
                selectedOption: selectedOption,
                imagePath: 'assets/images/user_female.png',
                label: 'Female',
                textColor: const Color(0xFF043E52),
                onSelected: () {
                  setState(() {
                    selectedOption = 1;
                  });
                },
              ),
              const SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MainScreen()), // Use your preferences screen class
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE16A3D),
                  fixedSize: const Size(320, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                  height: 40), // Add space between the last text and the button
            ],
          ),
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final int index;
  final int selectedOption;
  final String imagePath;
  final String label;
  final Color textColor;
  final VoidCallback onSelected;

  const GenderOption({super.key, 
    required this.index,
    required this.selectedOption,
    required this.imagePath,
    required this.label,
    required this.textColor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: index == selectedOption
                        ? const Color(0xFF3CBA00)
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (index == selectedOption)
                Container(
                  margin: const EdgeInsets.all(6),
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3CBA00),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: textColor),
          ),
        ],
      ),
    );
  }
}
