// ignore_for_file: unnecessary_null_comparison

import 'package:contactos/src/features/common/domain/entities/user_entity.dart';
import 'package:contactos/src/features/login/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final state = context.watch<AuthCubit>().state;
    UserEntity? user;

 if(state is AuthSuccess) {
      user = state.user;
    }

    return Container(
      padding: const EdgeInsets.all(15),
      height: 85,
      width: width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(100))),
      ),
      child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: user!.avatar != null ? NetworkImage(user.avatar): AssetImage(""),
                  radius: 35,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Text(
                        "${user.name} ${user.lastName}",
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                        ),
                      
                     
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      user.email,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }
}