import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb();

    // complete cycle payment by paymob
    // apply meduim level caching by sqflite
    // apply meduim level pagination

    return _database!;
  }

  // ================= INIT DB =================
  Future<Database> _initDb() async {
    String databasePath = await getDatabasesPath();

    String path = join(databasePath, 'database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreateDb);
  }

  Future<void> _onCreateDb(Database db, int version) async {
    await db.execute('''
     CREATE TABLE products(
      id TEXT PRIMARY KEY,
      title TEXT,
      description TEXT,
      price INTEGER,
      imageCover TEXT,
      images TEXT,
      categoryName TEXT,
      ratingsAverage REAL,
      ratingsQuantity INTEGER,
      priceAfterDiscount INTEGER
)

    ''');
  }

  // ================= INSERT =================

  Future<void> insertBatch({
    required String table,
    required List<Map<String, dynamic>> dataList,
  }) async {
    final db = await database;

    final batch = db.batch();

    for (final data in dataList) {
      batch.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  // ================= GET =================

  Future<List<Map<String, dynamic>>> getData({
    required String table,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    final db = await database;

    return await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
  }

  // ================= UPDATE =================

  Future<int> update({
    required String table,
    required Map<String, dynamic> data,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final db = await database;

    return await db.update(table, data, where: where, whereArgs: whereArgs);
  }

  // ================= DELETE =================

  Future<int> delete({
    required String table,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final db = await database;

    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  // ================ CLEAR TABLE =================

  Future<int> clearTable(String table) async {
    final db = await database;

    return await db.delete(table);
  }
}
