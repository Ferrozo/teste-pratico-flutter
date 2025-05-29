//

import 'package:contactos/src/core/helpers/db_helpers.dart';
import 'package:contactos/src/features/home/data/datasource/contacts_remote_data_source.dart';
import 'package:contactos/src/features/home/data/datasource/local/favorites_local_data_source.dart';
import 'package:contactos/src/features/home/data/repositories/contacts_repository_impl.dart';
import 'package:contactos/src/features/home/domain/repositories/contacts_repository.dart';
import 'package:contactos/src/features/home/domain/usecases/get_contacts_use_case.dart';
import 'package:contactos/src/features/home/presentation/cubit/contacts_cubit.dart';
import 'package:contactos/src/features/login/data/local/user_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:contactos/src/features/login/domain/repositories/auth_repository.dart';
import 'package:contactos/src/features/login/domain/usecases/login_usecase.dart';
import 'package:contactos/src/features/login/data/remote/auth_remote_datasource.dart';
import 'package:contactos/src/features/login/data/repositories/auth_repository_impl.dart';
import 'package:contactos/src/features/login/presentation/auth_cubit/auth_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';


// *************************************************
//  Arquivo para injeção de depencia do projecto
// *************************************************

final sl = GetIt.instance;

Future<void> init() async {
  final db = await DbHelpers().initDb();

  sl.registerLazySingleton<Database>(() => db);

  // Datasources
  sl.registerLazySingleton(() => UserLocalDataSource(sl()));
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<ContactsRemoteDataSource>(() => ContactsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton(() => FavoritesLocalDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ContactsRepository>(() => ContactsRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetContactsUseCase(sl()));

  // Cubits
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerFactory(() => ContactsCubit(sl(), sl()));

  // Extern
  sl.registerLazySingleton(() => http.Client());

}

