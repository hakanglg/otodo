import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import '../../../widgets/fab/add_fab.dart';
import '../model/task_model.dart';

part 'tasks_string_values.dart';

class TasksView extends StatelessWidget with BaseState {
  final _model = TasksViewModel();

  _TasksStringValues values = _TasksStringValues();

  // Box<Task> taskBox = Hive.box(taskBoxString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddTaskFABButton(),
        appBar: AppBar(
          title: Text(values.title),
        ),
        body: ValueListenableBuilder(
          valueListenable: _model.taskBox.listenable(),
          builder: (context, Box<Task> box, _) {
            if (box.isEmpty) {
              return emptyText();
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return dismissibleWidget(context, index, box);
                  });
            }
          },
        ));
  }

  Center emptyText() {
    return Center(
      child: Text(
        values.emptyText,
        textScaleFactor: .9,
      ),
    );
  }

  Dismissible dismissibleWidget(
      BuildContext context, int index, Box<Task> box) {
    return Dismissible(
      background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: Padding(
            padding: context.horizontalPaddingNormal,
            child: Icon(Icons.delete),
          )),
      onDismissed: (direction) => _model.removeTask(index),
      key: UniqueKey(),
      child: taskListTileSection(box, index, context),
    );
  }

  ListTile taskListTileSection(Box<Task> box, int index, BuildContext context) {
    return ListTile(
        title: titleText(box, index, context),
        trailing: trailingIconButton(index, box));
  }

  Text titleText(Box<Task> box, int index, BuildContext context) {
    return Text(
      box.getAt(index)!.title,
      style: box.getAt(index)!.isDone
          ? context.textTheme.bodyText1
          : context.textTheme.bodyText2,
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
}
