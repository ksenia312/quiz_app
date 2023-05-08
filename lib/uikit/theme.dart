import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  bool isDark = false;

  ThemeMode get mode => isDark ? ThemeMode.dark : ThemeMode.light;

  void setIsDark(bool value) {
    isDark = value;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      fontFamily: 'Ysabeau',
      scaffoldBackgroundColor: const Color(0xFF231E3B),
      colorScheme: ColorScheme.dark(
        primary: Colors.purple.shade800,
        onPrimary: Colors.white,
        surface: Colors.purple.shade900,
        onSurface: Colors.white,
        secondary: Colors.purple.shade900,
        primaryContainer: Colors.purple.shade600,
        onSecondary: Colors.white,
        onBackground: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(textColor: Colors.white),
    );
  }

  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Ysabeau',
      scaffoldBackgroundColor: const Color(0xFFEDEAFF),
      colorScheme: ColorScheme.light(
        primary: Colors.purple.shade400,
        onPrimary: Colors.white,
        surface: Colors.purple.shade100,
        onSurface: Colors.purple.shade900,
        secondary: Colors.purple.shade600,
        primaryContainer: Colors.purple.shade50,
        onSecondary: Colors.purple.shade900,
        onBackground: Colors.purple.shade600,
      ),
      listTileTheme: ListTileThemeData(
        textColor: Colors.purple.shade900,
      ),
    );
  }
}
