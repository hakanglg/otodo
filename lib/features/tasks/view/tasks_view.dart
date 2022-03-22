import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:otodo/core/extension/string_extension.dart';
import 'package:otodo/core/init/lang/locale_keys.g.dart';

import '../../../core/base/base_state.dart';

import '../../../core/components/text/locale_text.dart';
import '../view_model/tasks_view_model.dart';
import '../../../main.dart';
import '../../../widgets/fab/add_fab.dart';
import '../model/task_model.dart';

part 'tasks_string_values.dart';

// LOCALIZATION EKLE THEME CHANGE EKel
class TasksView extends StatelessWidget with BaseState {
  final _model = TasksViewModel();

  _TasksStringValues values = _TasksStringValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddTaskFABButton(),
        appBar: AppBar(
          // leading: ValueListenableBuilder(
          //   valueListenable: Hive.box(themeBoxString).listenable(),
          //   builder: (context, box, _) {
          //   var  darkMode = box.get("darkMode", defaultValue: false);
          //     return
          //   },
          // ),
          leading: changeTheme(context),
          title: Text(values.title),
        ),
        body: ValueListenableBuilder(
          valueListenable: _model.taskBox.listenable(),
          builder: (context, Box<Task> box, _) {
            if (box.isEmpty) {
              return emptyText();
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return dismissibleWidget(context, index, box);
                  });
            }
          },
        ));
  }

  IconButton changeTheme(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.change_circle));
  }

  Center emptyText() {
    return Center(child: LocaleText(text: LocaleKeys.emptyTodo));
  }

  Dismissible dismissibleWidget(
      BuildContext context, int index, Box<Task> box) {
    return Dismissible(
      background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: Padding(
            padding: context.horizontalPaddingNormal,
            child: Icon(Icons.delete),
          )),
      onDismissed: (direction) => _model.removeTask(index),
      key: UniqueKey(),
      child: taskListTileSection(box, index, context),
    );
  }

  ListTile taskListTileSection(Box<Task> box, int index, BuildContext context) {
    return ListTile(
        title: titleText(box, index, context),
        trailing: trailingIconButton(index, box));
  }

  Text titleText(Box<Task> box, int index, BuildContext context) {
    return Text(
      box.getAt(index)!.title,
      style: box.getAt(index)!.isDone
          ? context.textTheme.bodyText1
          : context.textTheme.bodyText2,
    );
  }

  IconButton trailingIconButton(int index, Box<Task> box) {
    return IconButton(
        onPressed: () => _model.changeStatus(index),
        icon: box.getAt(index)!.isDone ? completedIcon() : notCompletedIcon());
  }

  Icon notCompletedIcon() {
    return const Icon(
      Icons.circle_outlined,
      color: Colors.white,
    );
  }

  Icon completedIcon() {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
    );
  }
}
