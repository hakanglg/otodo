import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../features/providers/theme_provider.dart';

class ElevatedThemeButton extends StatelessWidget {
  final ThemeData themeData;
  final IconData icon;

  const ElevatedThemeButton(
      {Key? key, required this.themeData, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).themeData =
              themeData;
        },
        icon: Icon(icon, color: context.appTheme.iconTheme.color));
  }
}
