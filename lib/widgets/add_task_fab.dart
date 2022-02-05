import 'package:flutter/material.dart';

import 'bottom_sheet_container.dart';

class AddTaskFAB extends StatelessWidget {
  void _showAddTaskModelBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => BottomSheetContainer());
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
