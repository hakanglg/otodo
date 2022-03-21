import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otodo/core/constants/app/app_constants.dart';
import 'package:otodo/core/init/lang/language_manager.dart';
import 'features/tasks/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';
import 'core/init/theme/dark_theme.dart';
import 'features/tasks/model/task_model.dart';
import 'features/tasks/view/tasks_view.dart';

// mobx ekle

const String taskBoxString = "taskBox";
const String themeBoxString = "darkModeBox";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(taskBoxString);
  await Hive.openBox(themeBoxString);

  runApp(MultiProvider(
    providers: [
      Provider<TasksViewModel>(create: (_) => TasksViewModel()),
    ],
    child: EasyLocalization(
      child: MyApp(),
      startLocale: LanguageManager.instance.enLocale,
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<Tasks>(context).loadTaskFromSharedPref();
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'OTODO',
              // locale: context.deviceLocale,
              theme: darkTheme,
              home: TasksView(),
            ));
  }
}
