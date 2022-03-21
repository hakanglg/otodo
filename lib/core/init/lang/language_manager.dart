import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager instance = LanguageManager._init();

  LanguageManager._init();

  final enLocale = Locale("en", "UK");
  final trLocale = Locale("tr", "TR");

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
