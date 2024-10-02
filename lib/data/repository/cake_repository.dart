import 'package:sqflite/sqflite.dart';

import '../models/cake_model.dart';

class CakeRepository {
  late Database _database;

  CakeRepository() {
    syncDatabase();
  }

  Future<void> syncDatabase() async {
    _database = await openDatabase(
      'cake_database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE Cakes (id TEXT PRIMARY KEY, name TEXT, image TEXT, recipe TEXT, description TEXT, size TEXT, isFavourite INTEGER);");
      },
    );
  }

  Future<void> insertCake(Cake cake) async {
    await syncDatabase();
    await _database.insert('Cakes', cake.toJson());
  }

  Future<List<Cake>> getAllCakes() async {
    await syncDatabase();
    final List<Map<String, dynamic>> maps = await _database.query('Cakes');
    return maps.map((map) => Cake.fromJson(map)).toList();
  }

  Future<void> updateCake(Cake cake) async {
    await syncDatabase();
    await _database.update(
      'Cakes',
      cake.toJson(),
      where: "id = ?",
      whereArgs: [cake.id],
    );
  }

  Future<void> deleteCake(String id) async {
    await syncDatabase();
    await _database.delete(
      'Cakes',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    await _database.close();
  }
}
