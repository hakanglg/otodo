import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import '../core/constants/colors.dart';
import '../model/task.dart';

class BottomSheetContainer extends StatelessWidget {
  TaskController taskController = Get.put(TaskController());
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: containerLight,
      child: TextField(
        cursorColor: Theme.of(context).cursorColor,
        style: Theme.of(context).textTheme.subtitle1,
        onSubmitted: (value) {
          var newTask = Task.create(title: value);
          taskController.addTask(newTask);
          // taskController.tasks.refresh();
          Get.back();
        },
        controller: t1,
        autofocus: true,
        maxLines: null,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "addNewTask".tr,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.03)),
      ),
    );
  }
}
