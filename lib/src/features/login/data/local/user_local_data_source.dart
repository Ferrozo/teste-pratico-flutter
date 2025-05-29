import 'package:contactos/src/features/common/data/models/user_model.dart';
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDataSource {
  final Database db;

  UserLocalDataSource(this.db);

  Future<void> saveUser(UserEntity user, String token) async {
    await db.insert(
      'user',
      {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'last_name': user.lastName,
        'avatar': user.avatar,
        'token': token,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserModel?> getUser() async {
    final result = await db.query('user', limit: 1);
    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }

  Future<void> deleteUser() async {
    await db.delete('user');
  }
}

