// ignore_for_file: file_names, must_be_immutable

import 'package:contactos/src/features/login/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  final TextEditingController searchController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthCubit>().state;

    String? avatarUrl;
    if (state is AuthSuccess) {
      avatarUrl = state.user.avatar;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.grey.withAlpha(100),
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 28,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Text(
              "Contactos",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty
                  ? NetworkImage(avatarUrl)
                  : const AssetImage("assets/images/default_avatar.png")
                        as ImageProvider,
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextField(
          controller: searchController,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Buscar contatos...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
