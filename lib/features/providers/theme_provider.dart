import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../main.dart';
import '../tasks/model/task_model.dart';

class ThemeProvider extends ChangeNotifier {
  Box<Task> themeBox = Hive.box(themeBoxString);

  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // themeBox.put("isDarkMode", _themeData);
    notifyListeners();
  }
}
