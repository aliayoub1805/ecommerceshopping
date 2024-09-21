import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
      primarySwatch: Colors.purple,
      primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      colorScheme: ColorScheme(
        primary: Colors.deepPurple,
        secondary: Colors.deepPurpleAccent,
        surface: isDarkTheme ? Colors.grey.shade700 : Colors.white,
        background: isDarkTheme ? Colors.grey.shade800 : Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: isDarkTheme ? Colors.white : Colors.black, // لون النص على السطح
        onBackground: isDarkTheme ? Colors.white : Colors.black, // لون النص على الخلفية
        onError: Colors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: isDarkTheme ? Colors.grey[850] : Colors.white,
        iconTheme: IconThemeData(color: isDarkTheme ? Colors.white : Colors.black), // لون الأيقونات
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black, // لون النص في العنوان
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: isDarkTheme ? Colors.white : Colors.black), // نص عادي
        bodyMedium: TextStyle(color: isDarkTheme ? Colors.white70 : Colors.black54), // نص ثانوي
        // يمكنك تخصيص المزيد من النصوص إذا لزم الأمر
      ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : Colors.black, // لون الأيقونات العامة
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: isDarkTheme ? Colors.deepPurple : Colors.lightBlue,
        cursorColor: isDarkTheme ? Colors.white : Colors.black,
      ),
    );
  }
}