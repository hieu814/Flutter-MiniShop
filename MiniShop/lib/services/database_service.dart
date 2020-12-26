import 'dart:async';
import 'package:MiniShop/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = new DatabaseService.internal();
  factory DatabaseService() => _instance;

  static Database _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }
    _db = await createDatabase();
    return _db;
  }

  DatabaseService.internal();

  createDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'minishop.db'),
        onCreate: (db, version) async {
      return db.execute(
        "CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT,imgUrl TEXT, price TEXT,description TEXT)",
      );
    }, version: 1);
  }

  Future<void> insertProduct(Product product) async {
    // Get a reference to the database.
    print("Get a reference to the database");
    final Database db = await database;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      'products',
      product.toMap(),
      where: "id = ?",
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      'products',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Product>> products() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        name: maps[i]['name'],
        imgUrl: maps[i]['imgUrl'],
        price: maps[i]['price'],
        description: maps[i]['description'],
      );
    });
  }

  Future close() async => _db.close();
}
