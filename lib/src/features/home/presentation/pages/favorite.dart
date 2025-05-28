import 'package:contactos/src/features/home/presentation/components/contact_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ContactCard(
                avatar: "https://reqres.in/img/faces/8-image.jpg",
                email: "example@example.com",
                userName: "Domingos Roger",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/11-image.jpg",
                email: "example@example.com",
                userName: "Edgar Fernando",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
