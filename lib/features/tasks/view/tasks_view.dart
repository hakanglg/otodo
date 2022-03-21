import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:otodo/features/add_tasks/view/add_task_view.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import 'package:otodo/main.dart';
import 'package:provider/provider.dart';
import '../../../widgets/fab/add_fab.dart';
import '../../model/task_model.dart';

class TasksView extends StatelessWidget with BaseState {
  final _model = TasksViewModel();

  Box<Task> taskBox = Hive.box(taskBoxString);

  @override
  Widget build(BuildContext context) {
    final _tasks = Provider.of<TasksViewModel>(context);

    return Scaffold(
        floatingActionButton: AddTaskFABButton(),
        appBar: AppBar(
          title: Text("OTODO"),
        ),
        body: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, Box<Task> box, _) {
            if (box.isEmpty) {
              return Text("data");
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) => _model.removeTask(index),
                      key: UniqueKey(),
                      child: ListTile(
                          // onTap: () => _showAddTaskModelBottomSheet(context),
                          // title: Text(_tasks.taskList[index].title,
                          //     style: _tasks.taskList[index].isDone
                          //         ? context.textTheme.bodyText2
                          //         : context.textTheme.bodyText1),
                          title: titleText(box, index, context),
                          trailing: trailingIconButton(index, box)

                          // trailing: IconButton(
                          //   onPressed: () {
                          //     _tasks.toggleStatus(index);
                          //   },
                          //   icon: _tasks.taskList[index].isDone
                          //       ? Icon(
                          //           Icons.check_circle,
                          //           color: colorConstants.spotifyGreen,
                          //         )
                          //       : Icon(
                          //           Icons.circle_outlined,
                          //           color: colorConstants.white,
                          //         ),
                          // )
                          ),
                    );
                  });
            }
          },
        ));
  }

  Text titleText(Box<Task> box, int index, BuildContext context) {
    return Text(
                          box.getAt(index)!.title,
                          style: box.getAt(index)!.isDone
                              ? context.textTheme.bodyText2
                              : context.textTheme.bodyText1,
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
  // myButton(index, box),

  // mobxBody(_tasks)
  // Observer mobxBody(TasksViewModel _tasks) {
  //   return Observer(builder: (_) {
  //     return ListView.builder(
  //         itemCount: _tasks.getLenght,
  //         itemBuilder: (context, index) => Dismissible(
  //             key: UniqueKey(),
  //             onDismissed: (direction) => _tasks.removeTask(index),
  // child: ListTile(
  //     // title: Text(_tasks.taskList[index].title,
  //     //     style: _tasks.taskList[index].isDone
  //     //         ? context.textTheme.bodyText2
  //     //         : context.textTheme.bodyText1),
  //     title: Text(box.getAt(index)!.title),
  //     trailing: IconButton(
  //       onPressed: () {
  //         _tasks.toggleStatus(index);
  //       },
  //       icon: _tasks.taskList[index].isDone
  //           ? Icon(
  //               Icons.check_circle,
  //               color: colorConstants.spotifyGreen,
  //             )
  //           : Icon(
  //               Icons.circle_outlined,
  //               color: colorConstants.white,
  //             ),
  //     ))));
  // });
  // }
}
