import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/base/base_state.dart';
import '../../../core/components/text/locale_text.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class SettingsView extends StatelessWidget with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText(text: LocaleKeys.settings),
      ),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [darkModeSection(), languageSection(context)],
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

  Row darkModeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.darkMode),
        Switch(
            activeColor: colorConstants.spotifyGreen,
            value: true,
            onChanged: (value) {
              value = !value;
            })
      ],
    );
  }
}
