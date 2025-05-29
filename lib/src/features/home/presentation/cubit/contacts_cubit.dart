
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/home/data/datasource/local/favorites_local_data_source.dart';
import 'package:contactos/src/features/home/domain/usecases/get_contacts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final GetContactsUseCase getContactsUseCase;
  final FavoritesLocalDataSource favoritesLocalDataSource;
  List<UserEntity> _allContacts = [];

  ContactsCubit(this.getContactsUseCase, this.favoritesLocalDataSource) : super(ContactsInitial());

  Future<void> fetchContacts() async {
    emit(ContactsLoading());
    try {
      final result = await getContactsUseCase.call();
      final favIds = await favoritesLocalDataSource.getAllFavorites();

      _allContacts = result.map((user) {
        return UserEntity(
          id: user.id,
          name: user.name,
          email: user.email,
          avatar: user.avatar,
          lastName: user.lastName,
          isFavorite: favIds.contains(user.id),
        );
      }).toList();

      emit(ContactsLoaded(_allContacts));
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

  Future<void> toggleFavorite(UserEntity user) async {
    if (user.isFavorite!) {
      await favoritesLocalDataSource.removeFavorite(user.id);
    } else {
      await favoritesLocalDataSource.addFavorite(user.id);
    }

    await fetchContacts(); 
  }
}

