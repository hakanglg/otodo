import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomIconNavigatorButton extends StatelessWidget {
  final Widget pageView;
  final IconData icon;
  const CustomIconNavigatorButton(
      {Key? key, required this.pageView, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageView,
              ));
        },
        icon: Icon(icon, color: context.appTheme.iconTheme.color));
  }
}
