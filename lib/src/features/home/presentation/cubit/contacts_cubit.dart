
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/home/domain/usecases/get_contacts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contacts_state.dart';
class ContactsCubit extends Cubit<ContactsState> {
  final GetContactsUseCase getContactsUseCase;
  List<UserEntity> _allContacts = [];

  ContactsCubit(this.getContactsUseCase) : super(ContactsInitial());

  Future<void> fetchContacts() async {
    emit(ContactsLoading());
    try {
      final result = await getContactsUseCase.call();
      _allContacts = result;
      emit(ContactsLoaded( result));
    } catch (e) {
      emit(ContactsError(e.toString()));
    }
  }

  void filterContacts(String query) {
    final filtered = _allContacts.where((user) {
      final nameMatch = user.name.toLowerCase().contains(query.toLowerCase());
      final emailMatch = user.email.toLowerCase().contains(query.toLowerCase());
      return nameMatch || emailMatch;
    }).toList();

    emit(ContactsLoaded(filtered));
  }
}
