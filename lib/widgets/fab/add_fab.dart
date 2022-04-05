import 'package:flutter/material.dart';
import '../../core/constants/color_constants.dart';

import '../../features/add_tasks/view/add_task_view.dart';

class AddTaskFABButton extends StatelessWidget {
  const AddTaskFABButton({Key? key}) : super(key: key);

  void _showAddTaskModelBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => AddTaskView());
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddTaskModelBottomSheet(context),
      child: Icon(
        Icons.add,
        color: ColorConstants.instance.white,
      ),
    );
  }
}
