import 'package:contactos/src/features/home/presentation/components/profile_user_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [const SizedBox(height: 20), ProfileUserCard()],
          ),
        ),
      ),
    );
  }
}
