import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/home/domain/repositories/contacts_repository.dart';

class GetContactsUseCase {
  final ContactsRepository repository;

  GetContactsUseCase(this.repository);

  Future<List<UserEntity>> call() {
    return repository.getContacts();
  }
}
