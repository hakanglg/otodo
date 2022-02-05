import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/translation/translation.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = "OTODO";
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: title,
      home: HomeView(),
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en_US', 'UK'),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => HomeView())],
      theme: darkTheme,
    );
  }
}
