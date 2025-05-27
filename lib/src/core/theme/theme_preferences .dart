// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  // ignore: constant_identifier_names
  static const THEME_KEY = "theme_key";

  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_KEY, value);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_KEY) ?? false;
  }
}