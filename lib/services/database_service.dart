import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/incident.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._();
  static Database? _database;

  DatabaseService._();

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'incidents.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE incidents(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, photoPath TEXT, audioPath TEXT, date TEXT, officerName TEXT, badgeNumber TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertIncident(Incident incident) async {
    final db = await database;
    await db.insert('incidents', incident.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Incident>> getIncidents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('incidents');

    return List.generate(maps.length, (i) {
      return Incident.fromMap(maps[i]);
    });
  }

  Future<void> deleteIncident(int id) async {
    final db = await database;
    await db.delete('incidents', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearIncidents() async {
    final db = await database;
    await db.delete('incidents');
  }
}
