import 'package:contactos/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

  // *********************************************************
  //  ARQUIVO PARA DEFINIR O TEMA DA APLICAÇÃO
  // *********************************************************


class AppTheme {

  // **********************************************
  //  CONFIGURAÇÃO PARA TEMA CLARO(LIGHT MODE)
  // **********************************************

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryLight,
    onTertiary: AppColors.blackColor,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSurface: Colors.black,
    onSecondary: AppColors.blackColor,
  ),
  scaffoldBackgroundColor: AppColors.backgroundLight,
  cardColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
      labelMedium: TextStyle(color: AppColors.backgroundDark)
  ),
);

  // **********************************************
  //  CONFIGURAÇÃO PARA TEMA ESCURO(DARK MODE)
  // **********************************************

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: ColorScheme.dark(
    primary: AppColors.primaryDark,
    surface: AppColors.backgroundDark,
    onPrimary: AppColors.backgroundDark,
    onSurface: AppColors.whiteColor,
    onTertiary: AppColors.blackColor,
        onSecondary: AppColors.blackColor,
  ),
    textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.whiteColor),
    bodyMedium: TextStyle(color: AppColors.whiteColor),
    labelMedium: TextStyle(color: AppColors.backgroundDark)
  ),
  );
}
