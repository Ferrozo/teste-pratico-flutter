import 'package:contactos/src/core/theme/theme_preferences%20.dart';
import 'package:flutter/material.dart';

// ************************************************
//  CLASS COM A FUNÇÃO PARA MUDANÇA DE TEMA
// ************************************************

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final _prefs = ThemePreferences();

  ThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() async {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    await _prefs.setTheme(_themeMode == ThemeMode.dark);
  }

  void _loadTheme() async {
    bool isDark = await _prefs.getTheme();
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

