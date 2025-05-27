import 'package:flutter/material.dart';

// ************************************************
//  CLASS COM A FUNÇÃO PARA MUDANÇA DE TEMA
// ************************************************

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  //Função para detectar o tema do dispositivo
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  //Função para mudar de tema
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
