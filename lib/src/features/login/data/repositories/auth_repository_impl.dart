import 'package:contactos/src/features/common/data/models/token_model.dart';
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/login/domain/repositories/auth_repository.dart';
import 'package:contactos/src/features/login/data/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<TokenModel> login(String email, String password) {
    return remote.login(email, password);
  }

  @override
  Future<UserEntity> getUser(String token, int userId) {
    return remote.getUser(token, userId);
  }

}
