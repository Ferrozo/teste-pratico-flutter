import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DbHelpers {
  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'localdb.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE user (
            id TEXT PRIMARY KEY,
            name TEXT,
            email TEXT,
            last_name TEXT,
            avatar TEXT,
            token TEXT
                    )
                  ''');

        await db.execute('''
          CREATE TABLE favorites (
            id TEXT PRIMARY KEY
          )
        ''');
      },
    );
  }
}
