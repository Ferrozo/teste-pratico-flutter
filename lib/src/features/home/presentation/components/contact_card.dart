import 'package:contactos/src/core/app_assets/app_assets.dart';
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/home/presentation/cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.user,
    required this.onCardClick,
    required this.onMoreInfoClick,
  });

  final UserEntity user;
  final Function onMoreInfoClick;
  final Function onCardClick;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(15),
      height: 85,
      width: width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(100))),
      ),
      child: InkWell(
        onTap: () {
          onCardClick();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: user.avatar.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder: AppAssets.avatar,
                          image: user.avatar,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppAssets.avatar,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                        ),
                        const SizedBox(width: 4),
                        if (user.isFavorite!)
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                      ],
                    ),
                    Text(
                      user.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (value) {
                if (value == 'info') {
                  onMoreInfoClick();
                } else if (value == 'favorite') {
                  context.read<ContactsCubit>().toggleFavorite(user);
                } else if (value == 'edit') {
                  debugPrint('Editar ${user.name}');
                } else if (value == 'delete') {
                  debugPrint('Deletar ${user.name}');
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'info', child: Text('Detalhes')),
                const PopupMenuItem(value: 'edit', child: Text('Editar')),
                PopupMenuItem(
                  value: 'favorite',
                  child: Text(
                    user.isFavorite!
                        ? 'Remover dos favoritos'
                        : 'Adicionar aos favoritos',
                  ),
                ),
                const PopupMenuItem(value: 'delete', child: Text('Remover')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
