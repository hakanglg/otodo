import 'package:flutter/material.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../model/task_model.dart';
import '../../model/tasks_model.dart';
part "add_task_string_values.dart";

class AddTaskView extends StatelessWidget with BaseState {
  Tasks tasks = Tasks();
  _AddTaskViewStringValues values = _AddTaskViewStringValues();
  TextEditingController t1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: colorConstants.white,
      child: TextField(
        cursorColor: context.appTheme.textSelectionTheme.cursorColor,
        style: context.textTheme.subtitle1,
        onSubmitted: (value) {
          var value = t1.text;
          var newTask = Task.create(title: value);
          Provider.of<Tasks>(context, listen: false).addTask(newTask);

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
