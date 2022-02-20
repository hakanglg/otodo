import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData lightTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: containerLight,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      bodyText2: TextStyle(
          color: containerLight,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.lineThrough),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: cursorLight));
