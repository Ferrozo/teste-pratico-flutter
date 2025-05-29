import 'package:contactos/src/features/common/domain/entities/user_entity.dart';

abstract class ContactsRepository {
    Future<List<UserEntity>> getContacts();
}