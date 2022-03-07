import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/base/base_state.dart';
import '../../../widgets/fab/add_fab.dart';
import '../../model/task_model.dart';
import '../../model/tasks_model.dart';
import 'package:provider/provider.dart';
part "tasks_string_values.dart";
part "../view_model/tasks_view_model.dart";

class TasksView extends StatefulWidget with BaseState {
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> with BaseState {
  _TasksStringValues values = _TasksStringValues();
  _TasksViewModel model = _TasksViewModel();
  Tasks tasks = Tasks();

  late Box<Task> taskBox;

  @override
  void initState() {
    super.initState();

    taskBox = Hive.box<Task>("taskBox");
    tasks.getItem();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.box("taskBox").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddTaskFABButton(),
      appBar: customAppBar(context),
      body: Consumer<Tasks>(
        builder: (context, tasks, child) => ValueListenableBuilder(
            valueListenable: taskBox.listenable(),
            builder: (context, Box<Task> task, _) {
              return ListView.builder(
                itemCount: task.keys.length,
                itemBuilder: (context, index) {
                  final key = task.keys.toList()[index];
                  final value = task.get(key);

                  return ListTile(
                    onTap: tasks.removeTask(index),
                    title: Text(value!.title.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        tasks.toggleStatus(index);
                        print(value.isDone);
                      },
                      icon: value.isDone
                          ? Icon(
                              Icons.check_circle,
                              color: colorConstants.spotifyGreen,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              color: colorConstants.white,
                            ),
                      // color: Colors.white,
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

// TasksListViewBuilder(tasks)
  AppBar customAppBar(BuildContext context) {
    return AppBar(
        title: appBarTitleText(context), leading: appBarIconButton(context));
  }

  Text appBarTitleText(BuildContext context) {
    return Text(
      values.title,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  IconButton appBarIconButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.dark_mode,
          color: Theme.of(context).iconTheme.color,
        ));
  }

  ListView TasksListViewBuilder(Tasks tasks) {
    return ListView.builder(
        itemCount: tasks.getLenght,
        itemBuilder: (context, index) {
          return ListTile(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            title: titleText(tasks, context, index),
            trailing: trailingIconButton(tasks, index),
          );
        });
  }

  Text titleText(Tasks tasks, BuildContext context, int index) =>
      tasks.getTasks[index].isDone
          ? Text(
              tasks.getTasks[index].title.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            )
          : Text(
              tasks.getTasks[index].title.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            );

  IconButton trailingIconButton(Tasks tasks, int index) {
    return IconButton(
      onPressed: () {
        tasks.toggleStatus(index);
        print(tasks.getTasks[index].isDone);
      },
      icon: tasks.getTasks[index].isDone
          ? Icon(
              Icons.check_circle,
              color: colorConstants.spotifyGreen,
            )
          : Icon(
              Icons.circle_outlined,
              color: colorConstants.white,
            ),
      // color: Colors.white,
    );
  }
}
