import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/task_controller.dart';
import '../../controller/theme_controller.dart';
import '../../widgets/add_task_fab.dart';
import '../../widgets/tasks_listview_builder.dart';

// import 'package:thememode_selector/thememode_selector.dart';

class HomeView extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final String appBarTitle = "OTODO";
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context),
        body: TasksListViewBuilder(),
        floatingActionButton: AddTaskFAB(),
      ),
    );
  }

  // APPBAR SECTION
  AppBar customAppBar(context) {
    return AppBar(
        title: Text(
          appBarTitle,
          style: Theme.of(context).textTheme.headline5,
        ),
        leading: IconButton(
          onPressed: () {
            themeController.toggleDarkMode();
          },
          icon: themeController.isDarkMode
              ? Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                )
              : Icon(
                  Icons.light_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
        ));
  }
}
