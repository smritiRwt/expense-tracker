import 'package:expense/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<bool>((ref) => false); // false = light

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
    ),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Constants.blackColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Constants.whiteColor,
      selectedItemColor: Constants.blackColor,
      unselectedItemColor: Constants.gray,
    ),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  );
}
