import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/translation/translation.dart';

import 'core/theme/dark_theme.dart';
import 'views/home/home_view.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

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
      fallbackLocale: const Locale('en_US', 'UK'),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => HomeView())],
      theme: darkTheme,
    );
  }
}


// GETX KALDIR PROVİDER EKLE
// SSHARED PREF EKLE
