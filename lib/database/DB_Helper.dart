import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ink/models/book.dart';
import 'package:ink/models/seller.dart';
import 'package:ink/models/selling.dart';

class DBHelper {
  static const _database_name = "ink_DB.db";
  static const _database_version = 1;
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), _database_name);
    return openDatabase(
      path,
      onCreate: (db, version) {
        _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await _upgradeTables(db, oldVersion, newVersion);
      },
      version: _database_version,
    );
  }

  static void _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        isbn INTEGER,
        title TEXT,
        author TEXT,
        summary TEXT,
        imagePath TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE sellers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        accountName TEXT,
        profileImagePath TEXT,
        instagramLink TEXT,
        email TEXT,
        phoneNumber TEXT,
        location TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE sellings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bookId INTEGER,
        sellerId INTEGER,
        price REAL,
        isDeliveryAvailable INTEGER,
        isForSell INTEGER,
        isForExchange INTEGER,
        FOREIGN KEY (bookId) REFERENCES books (id),
        FOREIGN KEY (sellerId) REFERENCES sellers (id)
      )
    ''');
  }

  static Future<void> _upgradeTables(Database db, int oldVersion, int newVersion) async {
    print("Upgrading database from $oldVersion to $newVersion");
    // Implement your upgrade logic here if needed
  }

  Future<void> insertBook(Book book) async {
    final Database db = await DBHelper.database;
    await db.insert('books', book.toMap());
  }

  Future<void> insertSeller(Seller seller) async {
    final Database db = await DBHelper.database;
    await db.insert('sellers', seller.toMap());
  }

  Future<void> insertSelling(Selling selling) async {
    final Database db = await DBHelper.database;
    await db.insert('sellings', selling.toMap());
  }

  // Read operations

  Future<List<Book>> getBooks() async {
    final Database db = await DBHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (i) {
      return Book.fromMap(maps[i]);
    });
  }

  Future<List<Seller>> getSellers() async {
    final Database db = await DBHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('sellers');
    return List.generate(maps.length, (i) {
      return Seller.fromMap(maps[i]);
    });
  }

  Future<List<Selling>> getSellings() async {
    final Database db = await DBHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('sellings');
    return List.generate(maps.length, (i) {
      //return Selling.fromMap(maps[i]);
    });
  }

  // Update operation

  Future<void> updateBook(Book book) async {
    final Database db = await DBHelper.database;
    await db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  Future<void> updateSeller(Seller seller) async {
    final Database db = await DBHelper.database;
    await db.update(
      'sellers',
      seller.toMap(),
      where: 'id = ?',
      whereArgs: [seller.id],
    );
  }

  Future<void> updateSelling(Selling selling) async {
    final Database db = await DBHelper.database;
    await db.update(
      'sellings',
      selling.toMap(),
      where: 'id = ?',
      whereArgs: [selling.id],
    );
  }

  // Delete operation

  Future<void> deleteBook(int id) async {
    final Database db = await DBHelper.database;
    await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteSeller(int id) async {
    final Database db = await DBHelper.database;
    await db.delete(
      'sellers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteSelling(int id) async {
    final Database db = await DBHelper.database;
    await db.delete(
      'sellings',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
    Future<Book?> getBookById(int bookId) async {
    final Database db = await DBHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'books',
      where: 'id = ?',
      whereArgs: [bookId],
    );

    if (maps.isEmpty) {
      return null; // Book not found
    }

    return Book.fromMap(maps.first);
  }
  Future<List<Selling>> getSellingsByBookId(int bookId) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'sellings',
    where: 'bookId = ?',
    whereArgs: [bookId],
  );

  return List.generate(maps.length, (i) {
    //return Selling.fromMap(maps[i]);
  });
}


}
