import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/theme/dark_theme.dart';
import 'core/init/theme/light_theme.dart';
import 'features/tasks/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';
import 'features/tasks/model/task_model.dart';
import 'features/tasks/view/tasks_view.dart';

const String taskBoxString = "taskBox";
const String themeBoxString = "themeBox";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(taskBoxString);
  await Hive.openBox<dynamic>(themeBoxString);

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
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: () => const MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(themeBoxString).listenable(),
      builder: (context, Box box, _) {
        var darkMode = box.get("darkMode", defaultValue: false);
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: context.deviceLocale,
          title: ApplicationConstants.APP_TITLE,
          theme: darkMode ? darkTheme : lightTheme,
          home: TasksView(),
        );
      },
    );
  }
}
