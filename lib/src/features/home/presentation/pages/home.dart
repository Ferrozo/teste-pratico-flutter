import 'package:contactos/src/features/home/presentation/components/HomeAppBar.dart';
import 'package:contactos/src/features/home/presentation/components/contact_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 80, title: HomeAppBar()),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ContactCard(
                avatar: "https://reqres.in/img/faces/7-image.jpg",
                email: "example@example.com",
                userName: "Jose Manuel",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/2-image.jpg",
                email: "example@example.com",
                userName: "Wilson Cotripa",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/4-image.jpg",
                email: "example@example.com",
                userName: "Eduardo Paulo",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/1-image.jpg",
                email: "example@example.com",
                userName: "Augusto Vieira",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
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
              ContactCard(
                avatar: "https://reqres.in/img/faces/7-image.jpg",
                email: "example@example.com",
                userName: "Jose Manuel",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/2-image.jpg",
                email: "example@example.com",
                userName: "Wilson Cotripa",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/4-image.jpg",
                email: "example@example.com",
                userName: "Eduardo Paulo",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
              ContactCard(
                avatar: "https://reqres.in/img/faces/1-image.jpg",
                email: "example@example.com",
                userName: "Augusto Vieira",
                onCardClick: () {},
                onMoreInfoClick: () {},
              ),
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
