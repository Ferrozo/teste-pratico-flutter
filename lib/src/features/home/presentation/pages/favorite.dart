import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/home/presentation/components/contact_card.dart';
import 'package:contactos/src/features/home/presentation/cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final contactsCubit = context.read<ContactsCubit>();

    final allContacts = contactsCubit.state is ContactsLoaded
        ? (contactsCubit.state as ContactsLoaded).contacts
        : <UserEntity>[];
    allContacts.where((c) => c.isFavorite!).toList();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Favoritos')),
      body: BlocBuilder<ContactsCubit, ContactsState>(
        builder: (context, state) {
          if (state is ContactsLoaded) {
            final favorites = state.contacts
                .where((contact) => contact.isFavorite!)
                .toList();

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<ContactsCubit>().fetchContacts();
              },
              child: favorites.isEmpty
                  ? const Center(child: Text('Nenhum contato favorito.'))
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final user = favorites[index];
                        return ContactCard(
                          user: user,
                          onCardClick: () {
                            // abrir detalhes
                          },
                          onMoreInfoClick: () {
                            // ver mais
                          },
                        );
                      },
                    ),
            );
          } else if (state is ContactsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Erro ao carregar favoritos.'));
          }
        },
      ),
    );
  }
}
