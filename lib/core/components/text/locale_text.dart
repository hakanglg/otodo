import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:otodo/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String text;

  const LocaleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text.locale);
  }
}
