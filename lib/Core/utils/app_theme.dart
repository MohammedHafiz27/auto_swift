import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Color(0xffBABABA),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
    ),
  );
}
