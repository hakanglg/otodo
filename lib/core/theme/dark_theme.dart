import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData darkTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: containerLight,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
          color: containerLight,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.lineThrough),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: cursorLight));
