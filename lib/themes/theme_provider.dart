import 'package:chat_app/themes/dark_theme.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = LightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == LightMode) {
      themeData = DarkMode;
    } else {
      themeData = LightMode;
    }
  }
}