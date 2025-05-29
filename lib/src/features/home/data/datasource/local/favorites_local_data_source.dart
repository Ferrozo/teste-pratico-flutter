import 'package:sqflite/sqflite.dart';

class FavoritesLocalDataSource {
  final Database db;

  FavoritesLocalDataSource(this.db);

  Future<void> addFavorite(String userId) async {
    await db.insert('favorites', {'id': userId}, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFavorite(String userId) async {
    await db.delete('favorites', where: 'id = ?', whereArgs: [userId]);
  }

  Future<bool> isFavorite(String userId) async {
    final result = await db.query('favorites', where: 'id = ?', whereArgs: [userId]);
    return result.isNotEmpty;
  }

  Future<List<String>> getAllFavorites() async {
    final result = await db.query('favorites');
    return result.map((e) => e['id'] as String).toList();
  }
}
