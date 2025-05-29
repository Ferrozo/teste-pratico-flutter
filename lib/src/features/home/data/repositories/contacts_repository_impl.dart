import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/home/data/datasource/contacts_remote_data_source.dart';
import 'package:contactos/src/features/home/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsRemoteDataSource remoteDataSource;

  ContactsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<UserEntity>> getContacts() async {
    final models = await remoteDataSource.fetchContacts();
    return models;
  }
}
