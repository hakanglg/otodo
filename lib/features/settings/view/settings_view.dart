import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:otodo/core/components/column/my_column.dart';
import 'package:otodo/core/components/row/my_row.dart';
import 'package:otodo/features/settings/view_model/setting_view_model.dart';
import '../../../core/base/base_state.dart';
import '../../../core/components/text/locale_text.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class SettingsView extends StatelessWidget with BaseState {
  SettingsViewModel _model = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.appTheme.iconTheme.color,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: LocaleText(text: LocaleKeys.settings),
      ),
      body: MyRow(
        child: MyColumn(
          child: Column(
            children: [
              darkModeSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Row languageSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Language"),
        Text(
          "Turkish",
          style: context.textTheme.bodyText2!
              .copyWith(color: colorConstants.spotifyGreen),
        ),
      ],
    );
  }

  Row darkModeSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(LocaleKeys.darkMode),
        buildSwitchTheme(context)

        // ElevatedButton(
        //     onPressed: () => , child: Text("bas"))
      ],
    );
  }

  SizedBox buildSwitchTheme(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.05),
      child: LiteRollingSwitch(
        value: _model.isDarkMode,
        onChanged: (value) {
          _model.changeTheme(value);
          print(_model.isDarkMode);
        },
        colorOn: colorConstants.spotifyGreen,
        iconOn: Icons.sunny,
        iconOff: Icons.dark_mode,
      ),
    );
  }
}
