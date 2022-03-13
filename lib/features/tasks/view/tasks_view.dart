import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:otodo/core/base/base_state.dart';
import 'package:otodo/features/tasks/view_model/tasks_view_model.dart';
import '../../../widgets/fab/add_fab.dart';

class TasksView extends StatelessWidget with BaseState {
  TasksViewModel _model = TasksViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddTaskFABButton(),
      appBar: AppBar(
        title: Text("OTODO"),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: _model.getLenght,
            itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) => _model.removeTask(index),
                child: ListTile(
                    title: Text(_model.taskList[index].title,
                        style: _model.taskList[index].isDone
                            ? context.textTheme.bodyText2
                            : context.textTheme.bodyText1),
                    trailing: IconButton(
                      onPressed: () {
                        // => _m;})odel.toggleStatus(index)
                      },
                      icon: _model.taskList[index].isDone
                          ? Icon(
                              Icons.check_circle,
                              color: colorConstants.spotifyGreen,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              color: colorConstants.white,
                            ),
                    ))));
      }),
    );
  }
}
