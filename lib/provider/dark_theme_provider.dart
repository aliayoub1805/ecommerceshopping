import 'package:flutter/material.dart';

import '../models/dark_theme_perferences.dart';

class DarkThemeProvider1 with ChangeNotifier{
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme=>_darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}