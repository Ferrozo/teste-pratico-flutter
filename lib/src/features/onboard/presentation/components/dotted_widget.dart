import 'package:contactos/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DottedWidget extends StatelessWidget {
  const DottedWidget({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 13 : 8,
      width: isActive ? 13 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryDark
            : AppColors.blackColor.withAlpha(30),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}