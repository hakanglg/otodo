import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/color_constants.dart';

ThemeData get lightTheme => ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConstants.instance.spotifyGreen,
      hintStyle: TextStyle(
        color: ColorConstants.instance.white,
      ),
    ),
    scaffoldBackgroundColor: ColorConstants.instance.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorConstants.instance.spotifyGreen,
    ),
    iconTheme: IconThemeData(color: ColorConstants.instance.black),
    textTheme: TextTheme(
      headline5: TextStyle(
          color: ColorConstants.instance.black, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(
          color: ColorConstants.instance.black, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
          color: ColorConstants.instance.black,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp),
      bodyText1: TextStyle(
          color: ColorConstants.instance.spotifyGreen,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          decoration: TextDecoration.lineThrough),
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorConstants.instance.white));
