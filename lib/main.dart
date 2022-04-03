import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/theme/light_theme.dart';
import 'features/tasks/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';
import 'features/tasks/model/task_model.dart';
import 'features/tasks/view/tasks_view.dart';

const String taskBoxString = "taskBox";
const String themeBoxString = "darkModeBox";

// TODO: LOCALIZATION - Add localization
// TODO: THEME
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(taskBoxString);
  await Hive.openBox(themeBoxString);

  runApp(MultiProvider(
    providers: [
      Provider<TasksViewModel>(create: (_) => TasksViewModel()),
    ],
    child: EasyLocalization(
        path: ApplicationConstants.LANG_ASSET_PATH,
        supportedLocales: ApplicationConstants.SUPPORTEDLOCALS,
        fallbackLocale: ApplicationConstants.EN_LOCALE,
        saveLocale: true,
        child: ScreenUtilInit(
            designSize: Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: () => MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<Tasks>(context).loadTaskFromSharedPref();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: context.deviceLocale,
      title: 'OTODO',
      theme: lightTheme,
      home: TasksView(),
    );
  }
}
