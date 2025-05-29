// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    super.key,
    required this.searchController,
    required this.onChanged,
  });
  TextEditingController searchController;
  Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
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
                  ), // borda cinza
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // borda retangular
                  ),
                  padding: EdgeInsets.all(5), // espaço interno
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
              backgroundImage: NetworkImage(
                "https://reqres.in/img/faces/8-image.jpg",
              ),
              radius: 25,
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextField(
          controller: searchController,
          onChanged: (value) {
            onChanged(value);
          },
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
