import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/color_constants.dart';

ThemeData get darkTheme => ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConstants.instance.spotifyGreen,
      hintStyle: TextStyle(
        color: ColorConstants.instance.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorConstants.instance.spotifyGreen,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline5:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      subtitle1:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp),
      bodyText1: TextStyle(
          color: ColorConstants.instance.spotifyGreen,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          decoration: TextDecoration.lineThrough),
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorConstants.instance.white));
