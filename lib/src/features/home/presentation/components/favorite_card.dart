import 'package:contactos/src/core/app_assets/app_assets.dart';
import 'package:contactos/src/core/theme/app_colors.dart';
import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withAlpha(30)),
      ),
      height: 180,
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: user.avatar.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder: AppAssets.avatar,
                          image: user.avatar,
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppAssets.avatar,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                ),
                Icon(Icons.star, color: AppColors.primaryLight),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              user.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              user.email,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
             const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withAlpha(15),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(
                    onPressed: (){}, icon:  Icon(Icons.phone, color: AppColors.primaryDark,)),
                ),
                const SizedBox(width: 5),
                  Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(15),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(
                    onPressed: (){}, icon:  Icon(Icons.email, color: Colors.blue)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
