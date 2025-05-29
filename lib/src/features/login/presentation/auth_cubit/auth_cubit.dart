import 'package:contactos/src/features/common/data/models/user_model.dart';
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/login/data/local/user_local_data_source.dart';
import 'package:contactos/src/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final UserLocalDataSource localDataSource;

  AuthCubit(this.loginUseCase, this.localDataSource) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(email, password);

      if (user is UserModel) {
        await localDataSource.saveUser(user, user.token!);
      }

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void checkLoggedUser() async {
    final user = await localDataSource.getUser();

    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthFailure("Usuário não autenticado"));
    }
  }

  Future<void> logout() async {
    await localDataSource.deleteUser();
    emit(AuthInitial());
  }
}
