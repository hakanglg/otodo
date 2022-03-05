import 'package:flutter/material.dart';

import '../../features/add_tasks/view/add_task_view.dart';

class AddTaskFABButton extends StatelessWidget {
  void _showAddTaskModelBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => AddTaskView());
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddTaskModelBottomSheet(context),
      child: Icon(
        Icons.add,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
