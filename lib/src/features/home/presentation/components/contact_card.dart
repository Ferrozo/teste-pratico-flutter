import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactCard extends StatelessWidget {
  ContactCard({
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
        border: Border(
          bottom: BorderSide(color: Colors.grey.withAlpha(100)),
        ),
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
                CircleAvatar(backgroundImage: NetworkImage(user.avatar), radius: 28),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ],
            ),

            /// Substituímos o IconButton por PopupMenuButton
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (value) {
                if (value == 'info') {
                  onMoreInfoClick();
                } else if (value == 'edit') {
                  // exemplo: editar
                  debugPrint('Editar ${user.name}');
                } else if (value == 'delete') {
                  // exemplo: deletar
                  debugPrint('Deletar ${user.name}');
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'info', child: Text('Detalhes')),
                const PopupMenuItem(value: 'edit', child: Text('Editar')),
                const PopupMenuItem(value: 'edit', child: Text('Favorito')),
                const PopupMenuItem(value: 'delete', child: Text('Remover')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
