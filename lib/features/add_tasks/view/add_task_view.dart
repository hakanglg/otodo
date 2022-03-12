import 'package:flutter/material.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import 'package:uuid/uuid.dart';
import '../../../core/base/base_state.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:mobx/mobx.dart';
import '../../model/task_model.dart';
import '../../model/tasks_model.dart';
part "add_task_string_values.dart";

class AddTaskView extends StatelessWidget with BaseState {
  final TasksViewModel _model = TasksViewModel();

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
          var newTask = Task(title: value, isDone: false, uuid: Uuid().v1());
          _model.addTask(newTask);

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
