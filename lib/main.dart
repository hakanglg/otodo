import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otodo/features/model/task_model.dart';
import 'package:provider/provider.dart';

import 'core/theme/dark_theme.dart';
import 'features/model/tasks_model.dart';
import 'features/tasks/view/tasks_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Tasks().createPrefObject();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Tasks(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<Tasks>(context).loadTaskFromSharedPref();
    return MaterialApp(
      title: 'OTODO',
      theme: darkTheme,
      home: TasksView(),
    );
  }
}
