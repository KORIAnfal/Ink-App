
import 'package:flutter/material.dart';

class Search_Filter extends StatefulWidget {
  const Search_Filter({Key? key}) : super(key: key);
  @override
  _Search_FilterState createState() => _Search_FilterState();
}

double screenHeight = 0;
double screenWidth = 0;

class _Search_FilterState extends State<Search_Filter> {
  List<String> Category = ['Novels', 'Manga'];
  List<String> Language = ['Arabic', 'Frensh', 'Endglish'];
  List<String> Type = ['Sell', 'Exchange'];
  List<String> Wilaya = ['Alger'];
  List<String> Region = ['Siddi Abdellah'];
  String? selectedcategory = null;
  String? selectedlanguage = null;
  String? selectedtype = null;
  String? selectedwilaya = null;
  String? selectedregion = null;

  List<String> images = [
    'assets/images/poster1.jpg',
    'assets/images/poster2.jpg',
    'assets/images/poster3.jpg',
    'assets/images/poster4.jpg',
    'assets/images/poster5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset(
              'assets/images/ink-logo-black-01.png',
              width: 60,
              height: 80,
            ),
            onPressed: () {},
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    child: Container(
                      width: 310,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: Color(0x35016A6D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            Text('  Book Title, Author ...',
                                style: TextStyle(
                                  color: Colors.grey,
                                ))
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        SizedBox(
                          height: 60,
                          width: screenWidth * 0.3,
                          child: DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFF043E52))),
                            ),
                            items: Category.map(
                                (item) => DropdownMenuItem<String?>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 15),
                                    ))).toList(),
                            value: null,
                            hint: Text('Category'),
                            onChanged: (item) =>
                                setState(() => selectedcategory = item),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        SizedBox(
                          height: 60,
                          width: screenWidth * 0.31,
                          child: DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFF043E52))),
                            ),
                            items: Language.map(
                                (item) => DropdownMenuItem<String?>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 15),
                                    ))).toList(),
                            value: null,
                            hint: Text('Language'),
                            onChanged: (item) =>
                                setState(() => selectedlanguage = item),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        SizedBox(
                          height: 60,
                          width: screenWidth * 0.31,
                          child: DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFF043E52))),
                            ),
                            items: Type.map((item) => DropdownMenuItem<String?>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 15),
                                ))).toList(),
                            value: null,
                            hint: Text('Type'),
                            onChanged: (item) =>
                                setState(() => selectedtype = item),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        SizedBox(
                          height: 60,
                          width: screenWidth * 0.37,
                          child: DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFF043E52))),
                            ),
                            items:
                                Wilaya.map((item) => DropdownMenuItem<String?>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 15),
                                    ))).toList(),
                            value: null,
                            hint: Text('Wilaya'),
                            onChanged: (item) =>
                                setState(() => selectedwilaya = item),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        SizedBox(
                          height: 60,
                          width: screenWidth * 0.40,
                          child: DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFF043E52))),
                            ),
                            items:
                                Region.map((item) => DropdownMenuItem<String?>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 15),
                                    ))).toList(),
                            value: null,
                            hint: Text('Region'),
                            onChanged: (item) =>
                                setState(() => selectedregion = item),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Container(
                child: SizedBox(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.95,
                  child: ImageSlider(),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(9.0),
                child: Text(
                  "Explore by Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(width: screenWidth * 0.03),
                  Column(
                    children: [
                      Mycard(path: 'assets/images/9.jpg', title: "Scholair"),
                      Mycard(path: 'assets/images/9.jpg', title: "Novals"),
                      Mycard(path: 'assets/images/9.jpg', title: "Career"),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Column(
                    children: [
                      Mycard(path: 'assets/images/9.jpg', title: "Science"),
                      Mycard(path: 'assets/images/9.jpg', title: "Kids"),
                      Mycard(path: 'assets/images/9.jpg', title: "Comics"),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.019),
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Me before You',
    'The fault in our Stars',
    'Atomic Habits',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchItem in searchTerms) {
      if (searchItem.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItem);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchItem in searchTerms) {
      if (searchItem.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItem);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  final List<String> images = [
    'assets/images/poster1.jpg',
    'assets/images/poster2.jpg',
    'assets/images/poster3.jpg',
    'assets/images/poster4.jpg',
    'assets/images/poster5.jpg',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    _startAutoPlay();
  }

  void _startAutoPlay() {
    // Automatically change the page every 2 seconds
    Future.delayed(Duration(seconds: 2)).then((_) {
      if (_pageController.page == images.length - 1) {
        // If the current page is the last page, go back to the first page
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
      _startAutoPlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class Mycard extends StatelessWidget {
  String path = '';
  String title = '';
  Mycard({required this.path, required this.title});

  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: screenHeight * 0.12,
        width: screenWidth * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF043E52),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
