import 'package:flutter/material.dart';
import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode; // Declare the private variable here

  ThemeData get themeData => _themeData; // Now you can use it here

  bool get isDark => _themeData == darkMode; // Use _themeData here as well
  
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
    
  }
}