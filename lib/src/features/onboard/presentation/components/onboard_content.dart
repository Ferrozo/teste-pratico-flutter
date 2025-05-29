import 'package:contactos/src/features/onboard/domain/entities/onboard_entity.dart';
import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key, required this.onboard});
  final OnboardEntity onboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            onboard.image,
          ),
          width: 200,
        ),
        const SizedBox(height: 30),
        Text(
          onboard.title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          onboard.description,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}