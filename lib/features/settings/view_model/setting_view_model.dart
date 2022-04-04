import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:otodo/core/init/theme/light_theme.dart';

import '../../../core/init/theme/dark_theme.dart';
part 'setting_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  @observable
  bool isDarkMode = false;

  @observable
  ThemeData currentTheme = lightTheme;

  @action
  Future<void> changeTheme(bool darkMode) async {
    isDarkMode = darkMode;
  }
}
