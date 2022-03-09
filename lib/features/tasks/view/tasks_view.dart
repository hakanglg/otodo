import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:otodo/features/model/task_model.dart';
import 'package:provider/provider.dart';

import '../../../widgets/fab/add_fab.dart';
import '../../model/tasks_model.dart';

class TasksView extends StatelessWidget with BaseState {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: AddTaskFABButton(),
        appBar: AppBar(
          title: Text("OTODO"),
        ),
        body: ListView.builder(
            itemCount: value.getLenght,
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => value.removeTask(index),
                  child: ListTile(
                      title: Text(value.getTasks[index].title,
                          style: value.getTasks[index].isDone
                              ? context.textTheme.bodyText2
                              : context.textTheme.bodyText1),
                      trailing: IconButton(
                        onPressed: () => value.toggleStatus(index),
                        icon: value.getTasks[index].isDone
                            ? Icon(
                                Icons.check_circle,
                                color: colorConstants.spotifyGreen,
                              )
                            : Icon(
                                Icons.circle_outlined,
                                color: colorConstants.white,
                              ),
                      )
                      // trailing: ,
                      ),
                )),
      ),
    );
  }
}
