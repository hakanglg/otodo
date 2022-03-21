import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';
import 'core/init/theme/dark_theme.dart';
import 'features/model/task_model.dart';
import 'features/tasks/view/tasks_view.dart';

// mobx ekle

const String taskBoxString = "taskBox";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(taskBoxString);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<Tasks>(context).loadTaskFromSharedPref();
    return Provider<TasksViewModel>(
        create: (context) => TasksViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OTODO',
          theme: darkTheme,
          home: TasksView(),
        ));
  }
}
