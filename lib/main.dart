import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/dark_theme.dart';
import 'features/model/tasks_model.dart';
import 'features/tasks/view/tasks_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Tasks().createPrefObject();


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
      debugShowCheckedModeBanner: false,
      title: 'OTODO',
      theme: darkTheme,
      home: TasksView(),
    );
  }
}
