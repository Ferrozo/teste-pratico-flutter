
part of 'contacts_cubit.dart';


abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsLoaded extends ContactsState {
  final List<UserEntity> contacts;

  ContactsLoaded(this.contacts);
}

class ContactsError extends ContactsState {
  final String message;

  ContactsError(this.message);
}
