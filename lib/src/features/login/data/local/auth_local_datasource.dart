import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:sqflite/sqflite.dart';

class AuthLocalDataSource {
  final Database db;

  AuthLocalDataSource(this.db);

  Future<void> saveUser(UserEntity user) async {
    await db.insert('user', {
      'id': user.id,
      'name': user.name,
      'email': user.email,
    });
  }

  Future<UserEntity?> getUser() async {
    final List<Map<String, dynamic>> maps = await db.query('user', limit: 1);
    if (maps.isNotEmpty) {
      final data = maps.first;
      return UserEntity(id: data['id'], name: data['name'], email: data['email'], avatar: data['avatar']);
    }
    return null;
  }
}
