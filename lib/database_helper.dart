import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('markers.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE markers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL
      )
    ''');
  }

  Future<int> insertMarker(double latitude, double longitude) async {
    final db = await instance.database;

    return await db.insert(
      'markers',
      {'latitude': latitude, 'longitude': longitude},
    );
  }

  Future<List<Map<String, dynamic>>> fetchMarkers() async {
    final db = await instance.database;
    return await db.query('markers');
  }

  Future<int> deleteMarker(int id) async {
    final db = await instance.database;
    return await db.delete(
      'markers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}