import 'package:get/get.dart';

import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;

    if (isDarkMode) {
      Get.changeTheme(lightTheme);
    } else {
      Get.changeTheme(darkTheme);
    }
    update();
  }
}
