import 'package:contactos/src/features/common/presentaion/components/main_text_button.dart';
import 'package:contactos/src/features/home/presentation/components/HomeAppBar.dart';
import 'package:contactos/src/features/home/presentation/components/contact_card.dart';
import 'package:contactos/src/features/home/presentation/cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactsCubit>().fetchContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        title: HomeAppBar(
          searchController: _searchController,
          onChanged: (value) {
            context.read<ContactsCubit>().filterContacts(
              _searchController.text,
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Meus contactos",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: RefreshIndicator(
                onRefresh: () async {
                  await context.read<ContactsCubit>().fetchContacts();
                },
                child: BlocBuilder<ContactsCubit, ContactsState>(
                  builder: (context, state) {
                    if (state is ContactsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ContactsLoaded) {
                      final contacts = state.contacts;

                      if (contacts.isEmpty) {
                        return const Center(
                          child: Text('Nenhum contacto encontrado'),
                        );
                      }
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final user = contacts[index];
                          return ContactCard(
                            user: user,
                            onCardClick: () {
                              debugPrint('Selecionado: ${user.name}');
                            },
                            onMoreInfoClick: () {
                              debugPrint('Mais info: ${user.email}');
                            },
                          );
                        },
                      );
                    }

                    if (state is ContactsError) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 300,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.message,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: 180,
                                    child: MainTextButton(
                                      onPressed: () {
                                        context
                                            .read<ContactsCubit>()
                                            .fetchContacts();
                                      },
                                      title: 'Tentar novamente',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
