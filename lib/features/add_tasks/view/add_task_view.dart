import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../../core/base/base_state.dart';
import 'package:kartal/kartal.dart';
import '../../model/task_model.dart';
part "add_task_string_values.dart";

class AddTaskView extends StatelessWidget with BaseState {
  final TasksViewModel _model = TasksViewModel();

  _AddTaskViewStringValues values = _AddTaskViewStringValues();
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TasksViewModel>(context);

    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: colorConstants.white,
      child: TextField(
        cursorColor: context.appTheme.textSelectionTheme.cursorColor,
        style: context.textTheme.subtitle1,
        onSubmitted: (value) {
          var value = t1.text;
          var newTask = Task(title: value, uuid: Uuid().v1());
          // var box = Hive.box<Task>("taskBox");
          // box.add(newTask);
          tasks.addTask(newTask);
          // tasks.addTask(newTask);

          context.pop();
        },
        controller: t1,
        autofocus: true,
        maxLines: null,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: values.hintText,
            hintStyle: context.appTheme.inputDecorationTheme.hintStyle,
            contentPadding:
                EdgeInsets.symmetric(horizontal: context.dynamicHeight(0.03))),
      ),
    );
  }
}
