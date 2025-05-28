import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';


Future<Database> initDb() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'auth_app.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE user (
          id TEXT PRIMARY KEY,
          name TEXT,
          email TEXT,
          token TEXT
        )
      ''');
    },
  );
}

