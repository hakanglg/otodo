import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomBackButton extends StatelessWidget {
  final IconData icon;

  const CustomBackButton({Key? key, this.icon = Icons.arrow_back_ios_new})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(icon, color: context.appTheme.iconTheme.color));
  }
}
