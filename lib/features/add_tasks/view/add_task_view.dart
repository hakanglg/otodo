import 'package:flutter/material.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../tasks/view_model/tasks_view_model.dart';
import 'package:uuid/uuid.dart';
import '../../../core/base/base_state.dart';
import 'package:kartal/kartal.dart';
import '../../tasks/model/task_model.dart';
part "add_task_string_values.dart";

// ignore: must_be_immutable
class AddTaskView extends StatelessWidget with BaseState {
  final TasksViewModel _model = TasksViewModel();

  _AddTaskViewStringValues values = _AddTaskViewStringValues();
  TextEditingController t1 = TextEditingController();

  AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: colorConstants.white,
      child: TextField(
        cursorColor: context.appTheme.textSelectionTheme.cursorColor,
        style:
            context.textTheme.subtitle2!.copyWith(color: colorConstants.white),
        onSubmitted: (value) {
          var value = t1.text;
          var newTask = Task(title: value, uuid: const Uuid().v1());
          _model.addTask(context, newTask);
        },
        controller: t1,
        autofocus: true,
        maxLines: null,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: LocaleKeys.hintText.locale,
            hintStyle: context.appTheme.inputDecorationTheme.hintStyle,
            contentPadding:
                EdgeInsets.symmetric(horizontal: context.dynamicHeight(0.03))),
      ),
    );
  }
}
