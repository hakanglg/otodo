import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import 'package:otodo/main.dart';
import 'package:provider/provider.dart';
import '../../../widgets/fab/add_fab.dart';
import '../../model/task_model.dart';

class TasksView extends StatefulWidget {
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> with BaseState {
  final _model = TasksViewModel();

  late Box<Task> taskBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBox = Hive.box(taskBoxString);
  }

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
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // title: Text(_tasks.taskList[index].title,
                    //     style: _tasks.taskList[index].isDone
                    //         ? context.textTheme.bodyText2
                    //         : context.textTheme.bodyText1),
                    title: Text(box.get(index)!.title),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            var newValue = box.getAt(index)!.isDone =
                                !box.getAt(index)!.isDone;
                          });
                        },
                        icon: box.get(index)!.isDone
                            ? Icon(
                                Icons.check_box,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.check_box,
                                color: Colors.green,
                              )),
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
                  );
                });
          },
        ));
  }

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
