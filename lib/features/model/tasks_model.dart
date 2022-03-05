import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_model.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get getTasks => _tasks;

  int get getLenght => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
}
