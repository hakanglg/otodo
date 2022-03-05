import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';

class TasksListViewBuilder extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetX<TaskController>(
            builder: (controller) => taskController.tasks.isNotEmpty
                ? allTasksListViewBuild()
                : isEmptyListContainer(context)));
  }

  ListView allTasksListViewBuild() {
    return ListView.builder(
      itemCount: taskController.getLenght,
      itemBuilder: (context, index) => Dismissible(
        key: Key(taskController.tasks[index].uuid),
        background: Container(
            color: Colors.red,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            )),
        onDismissed: (direction) {
          taskController.removeTask(index);
        },
        child: ListTile(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          title: taskController.tasks[index].isDone
              ? Text(
                  taskController.tasks[index].title.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                )
              : Text(
                  taskController.tasks[index].title.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
          trailing: TaskToggleButton(index, context),
        ),
      ),
    );
  }

  Center isEmptyListContainer(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "addNewTask".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  IconButton TaskToggleButton(int index, context) {
    return IconButton(
      onPressed: () {
      
        // taskController.tasks[index].isDone =
        //     !taskController.tasks[index].isDone;
        // taskController.tasks.refresh();
        // print(taskController.tasks[index].isDone);
      },
      icon: taskController.tasks[index].isDone
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : Icon(
              Icons.circle_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
      color: Colors.white,
    );
  }
}
