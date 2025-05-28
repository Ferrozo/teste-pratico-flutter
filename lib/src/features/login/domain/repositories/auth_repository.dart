import 'package:contactos/src/features/common/data/models/token_model.dart';
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<TokenModel> login(String email, String password);
  Future<UserEntity> getUser(String token, int userId);
}
