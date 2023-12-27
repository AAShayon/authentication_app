import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeProvider extends ChangeNotifier {
  ThemeMode? themeMode;

  String themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode stringToThemeMode(String mode) {
    switch (mode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  getInitialThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String storedThemeMode = sharedPreferences.getString("themeMode") ?? "system";
    themeMode = stringToThemeMode(storedThemeMode);
    notifyListeners();
  }

  setThemeMode(ThemeMode _themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = _themeMode;
    prefs.setString('themeMode', themeModeToString(_themeMode));
    notifyListeners();
  }
}