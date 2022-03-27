import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../main.dart';
import '../model/task_model.dart';
part 'tasks_view_model.g.dart';

class TasksViewModel = _TasksViewModelBase with _$TasksViewModel;

abstract class _TasksViewModelBase with Store {
  @observable
  Box<Task> taskBox = Hive.box(taskBoxString);

  @action
  Future<void> addTask(BuildContext context, Task task) async {
    if (task.title.isNotEmpty) {
      await taskBox.add(task);
      context.pop();
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: LocaleKeys.errorMsg.locale,
        ),
      );
    }
  }

  @action
  Future<void> removeTask(int index) async {
    // await _tasks.removeAt(index);
    await taskBox.deleteAt(index);
  }

  @action
  changeStatus(int index) {
    var i = taskBox.getAt(index);
    i!.isDone = !i.isDone;
    i.save();
  }

  @action
  changeTask(int index, String value) {
    var i = taskBox.getAt(index);
    i!.title = value;
    i.save();
  }
}
