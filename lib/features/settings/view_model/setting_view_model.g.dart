// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  final _$isDarkModeAtom = Atom(name: '_SettingsViewModelBase.isDarkMode');

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  final _$currentThemeAtom = Atom(name: '_SettingsViewModelBase.currentTheme');

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  final _$changeThemeAsyncAction =
      AsyncAction('_SettingsViewModelBase.changeTheme');

  @override
  Future<void> changeTheme(bool isDarkMode) {
    return _$changeThemeAsyncAction.run(() => super.changeTheme(isDarkMode));
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
currentTheme: ${currentTheme}
    ''';
  }
}
