import 'package:flutter/material.dart';
import '../../../core/base/base_state.dart';
import '../../../widgets/fab/add_fab.dart';
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



  @override
  void initState() {
    super.initState();

    tasks.getTasks;
    // _getAllTaskFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddTaskFABButton(),
      appBar: customAppBar(context),
      body: Consumer<Tasks>(
        builder: (context, tasks, child) => TasksListViewBuilder(tasks),
      ),
    );
  }

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
      itemBuilder: (context, index) => ListTile(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        title: titleText(tasks, context, index),
        trailing: trailingIconButton(tasks, index),
      ),
    );
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
