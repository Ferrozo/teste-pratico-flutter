// ignore_for_file: file_names

import 'package:contactos/src/features/home/presentation/pages/favorite.dart';
import 'package:contactos/src/features/home/presentation/pages/home.dart';
import 'package:contactos/src/features/home/presentation/pages/profile.dart';
import 'package:flutter/material.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          FavoriteScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            
            border: Border(
                top: BorderSide(
              color: Colors.grey.withAlpha(100),
            ))),
        child: BottomNavigationBar(
          elevation: 0,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          showUnselectedLabels: true,
          selectedItemColor:  Colors.orange,
          onTap: (value) {
         setState(() {
                    _currentIndex = value;
                  });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}