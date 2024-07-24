import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/incident.dart';
import 'package:universal_io/io.dart' as uio;

class IncidentProvider with ChangeNotifier {
  Database? _database;
  List<Incident> _incidents = [];

  List<Incident> get incidents => _incidents;

  Future<void> initializeDB() async {
    if (uio.Platform.isAndroid || uio.Platform.isIOS) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'incidents.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE incidents(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, photoPath TEXT, audioPath TEXT, date TEXT, officerName TEXT, badgeNumber TEXT)',
          );
        },
        version: 1,
      );
      await loadIncidents();
    } else {
      // Manejo para la web u otras plataformas si es necesario
      print('Non-supported platform for sqflite');
    }
  }

  Future<void> loadIncidents() async {
    if (_database != null) {
      final List<Map<String, dynamic>> maps = await _database!.query('incidents');
      _incidents = List.generate(maps.length, (i) {
        return Incident.fromMap(maps[i]);
      });
      notifyListeners();
    }
  }

  Future<void> addIncident(Incident incident) async {
    if (_database != null) {
      await _database!.insert('incidents', incident.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      await loadIncidents();
    }
  }

  Future<void> deleteIncident(int id) async {
    if (_database != null) {
      await _database!.delete('incidents', where: 'id = ?', whereArgs: [id]);
      await loadIncidents();
    }
  }

  Future<void> clearIncidents() async {
    if (_database != null) {
      await _database!.delete('incidents');
      await loadIncidents();
    }
  }
}
