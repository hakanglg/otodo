import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:otodo/core/components/column/my_column.dart';
import 'package:otodo/core/components/row/my_row.dart';
import 'package:otodo/core/components/text/locale_text.dart';
import 'package:otodo/core/init/lang/locale_keys.g.dart';
import 'package:otodo/main.dart';
import '../../../core/components/button/custom_back_button.dart';
part "settings_string_values.dart";

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with BaseState {
  late Box themeBox;

  _SettingsStringValues values = _SettingsStringValues();

  @override
  void initState() {
    super.initState();
    themeBox = Hive.box(themeBoxString);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeBox.listenable(),
      builder: (context, Box box, _) {
        var darkMode = box.get("darkMode", defaultValue: false);
        return Scaffold(
            appBar: appBarSection(context),
            body: buildBodySection(darkMode, box));
      },
    );
  }

  AppBar appBarSection(BuildContext context) {
    return AppBar(
      leading: const CustomBackButton(),
      title: titleText(context),
    );
  }

  Text titleText(BuildContext context) {
    return Text(
      values.title,
      style: context.textTheme.bodyText2,
    );
  }

  MyColumn buildBodySection(darkMode, Box<dynamic> box) {
    return MyColumn(
      child: MyRow(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LocaleText(text: LocaleKeys.darkMode),
              buildSwitchButton(darkMode, box),
            ],
          )
        ],
      )),
    );
  }

  CupertinoSwitch buildSwitchButton(darkMode, Box<dynamic> box) {
    return CupertinoSwitch(
        trackColor: colorConstants.red,
        activeColor: colorConstants.spotifyGreen,
        value: darkMode,
        onChanged: (val) {
          box.put("darkMode", !darkMode);
        });
  }
}
