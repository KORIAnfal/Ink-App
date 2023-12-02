import 'package:flutter/material.dart';
import 'utils/custom_bottom_navigation_bar.dart';
import 'utils/CustomAppBar.dart';
import 'Guest_Account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Book {
  final String title;
  final String author;
  final String summary;
  final String imagePath;

  Book({
    required this.title,
    required this.author,
    required this.summary,
    required this.imagePath,
  });
}

// Example usage:
List<Book> books = [
  Book(
    title: "بحوث في فقه اللغة",
    author: "محمد الحباس",
    summary:
        "يحتوي هذا الكتاب على مدخل، وأربعة أبواب، وخاتمة، وذلك على النحو التالي: - مدخل: ويحتوي على قبس من التنزيل في التنويه بشأن العربية، وعلى بعض أقوال السلف، والعلماء والشعراء في تعظيم شأن العربية. - الباب الأول: دراسة عامة للغة وفقه اللغة. - الباب الثاني: دراسات عامة لبعض موضوعات فقه اللغة. - الباب الثالث: دراسات في المعاجم العربية. - الباب الرابع: مشكلات تواجه العربية. وتحت كل باب من الأبواب السابقة عدد من الفصول، وتحت كل فصل عدد من المباحث. - الخاتمة: وتتضمن ملخصًا يجمع أطراف ما ورد في هذا الكتاب.",
    imagePath: "1.jpg",
  ),
  Book(
    title: "Naissance d´une société",
    author: "Malek BENNABI",
    summary:
        "Une societe porte done en soi les qualites intrinseques qui assurent sa permanence et consacrent son identite et son role a travers Thistoire. Cet element de permanence est le contenu essentiel d'un corps social donne : c'est lui qui determine la duree et la stabilite d'une societe a travers le temps et lui permet de faire face a toutes les circonstances de son histoire. Et il s'identifie, en derniere analyse, au reseau des relations sociales qui relient les individus d'une societe entre eux et co-ordonne leurs activites diverses dans une fonction generale qui constitue la mission particuliere de cette societe. C'est la formation, meme embryonnaire, de ce reseau qui constitue en fait I'acte de naissance d'une societe dans I'histoire.",
    imagePath: "2.jpg",
  ),
  Book(
    title: "Le problème des idées dans le monde musulman ",
    author: "Malek BENNABI",
    summary:
        "Le changement de l'état civilisationnel d'une communauté étant subordonné au changement profond de l'Homme dans toutes ses dimensions, il est primordial que celui-ci en éprouve le besoin et possède le programme idéologique susceptible de lui en tracer la voie. C'est dans ce souci que les éditions El BAY'YINATE mettent entre les mains du lecteur une collection qui aspire à penser le changement, en espérant qu'il y trouvera l'instrument avec lequel il s'attellera à le pratiquer.",
    imagePath: "3.jpg",
  ),
  Book(
    title: "Le jardin des gens vertueux",
    author: "الإمام النووي",
    summary:
        "Salihin en arabe), livre écrit par Al-Nawawi au xiiie siècle, est une compilation de versets du Coran et de hadiths classés par thèmes (20 thèmes traitant des différents aspects du comportement vertueux du musulman en soi, en société et envers Dieu). Le livre contient 373 chapitres dont la plupart sont introduits par des versets du Coran et contient 1896 hadiths.",
    imagePath: "4.jpg",
  ),
  Book(
    title: "شروط النهضة",
    author: "مالك بن نبي",
    summary:
        "يتحدث عن الحاضر والتاريخ والمستقبل فيبدأ بأنشودة رمزية لكل من ذلك، ليرسم لنا بعدها دور الأبطال السياسة والفكرة الوثنية، وينقلنا من التكديس إلى البناء ويحدثنا عن شروط الدورة الخالدة وعناصرها وتوجيهها ومبدئها الأخلاقي وذوقها الجمالي في بناء الحضارة، والاستعمار والشعوب من الكتاب: وليس ينجو شعب من الاستعمار وأجناده،ـ الا اذا نجت نفسه من ان تتسع لذل الاستعمار، وتخلصت من تلك الروح التي تؤهله للاستعمار.ولا يذهب كابوسه عن الشعب _ كما يتصور بعضهم _ بكلمات أدبية أو خطابية، وانما بتحول نفسي، يصبح معه الفرد شيئا فشيئا قادرا علىى القيام بوظيفته الاجتماعية، جديرا بان تحترم كرامته، وحينئذ يرتفع عنه طابع (القابلية للاستعمار)، وبالتالي لن يقبل حكومة استعمارية تنهب ماله وتمتص دمه، فكأنه بتغيير نفسه قد غير وضع حاكميه تلقائيا الى الوضع الذي يرتضيه",
    imagePath: "6.jpg",
  ),
  Book(
    title: "Le livre et le milieu humain",
    author: "Malek BENNABI",
    summary:
        "Ce petit ouvrage fait partie du lot de manuscrits inédits Iégué par MaIek Bennabi et que ses héritiers ont décidé de mettre à la disposition du public par Ie truchement des Editions Samar. C’était à l’origine une étude destinée à une revue égyptienne mais pour on ne sait quelles raisons son auteur s’abstint finalement de la publier.",
    imagePath: "5.jpg",
  ),
];

class BookDetailsSellerScreen extends StatelessWidget {
  final String bookPath;

  const BookDetailsSellerScreen({Key? key, required this.bookPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Handle back button press
            Navigator.pop(context); // This line will navigate back
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.black,
            iconSize: 30, // Set the size of the profile icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Guest_Account()),
              );
            },

          ),
        ],
      ),
      body: _buildBookDetailsContent(context),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildBookDetailsContent(BuildContext context) {
    Book book = getBookDetailsFromPath(bookPath);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/${book.imagePath}',
                height: 210,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              book.author,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Book Summary',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE16A3D)),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust the horizontal padding as needed
              child: Text(
                book.summary,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign
                    .justify, // Optionally, add this line for justified text
                softWrap: true, // Optionally, add this line for text to wrap
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirm Deletion'),
                          content: Text('Are you sure  to delete this book?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Color(0xFFE16A3D)),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle Delete Account action
                                print('Delete Book confirmed');
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Color(0xFFE16A3D)),
                              ),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: Colors.white,
                          elevation: 4.0,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFE16A3D),
                    backgroundColor: Colors.white, // Text color
                    side: const BorderSide(
                        color: Color(0xFFE16A3D)), // Border color
                    minimumSize: const Size(133, 33), // Button size
                  ),
                  child: const Text('Delete'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add edit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFE16A3D), // Text color
                    minimumSize: const Size(133, 33), // Button size
                  ),
                  child: const Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Book getBookDetailsFromPath(String imagePath) {
    // Assuming imagePath is unique, find the book with the matching imagePath
    return books.firstWhere((book) => book.imagePath == imagePath);
  }
}
