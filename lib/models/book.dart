class Book {
  final int id; // Assuming you have an id field
  final String title;
  final String author;
  final String summary;
  final String imagePath;
  final int isbn;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.imagePath,
    required this.isbn,
  });

  // Convert a Book object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'summary': summary,
      'imagePath': imagePath,
      'isbn': isbn,
    };
  }

  // Create a Book object from a Map
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      summary: map['summary'],
      imagePath: map['imagePath'],
      isbn: map['isbn'],
    );
  }
}
