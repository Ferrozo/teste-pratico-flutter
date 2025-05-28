import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/login/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<UserEntity> call(String email, String password) async{
    final token = await repository.login(email, password);
    final user = await repository.getUser(token.token, 2);
    return user;
  }
  
}
