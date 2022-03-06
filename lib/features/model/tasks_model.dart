import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:otodo/features/model/task_model.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];

  // static SharedPreferences? _sharedPref;

  // List<String> _tasksAsString = [];

  UnmodifiableListView<Task> get getTasks => UnmodifiableListView(_tasks);
  // List<Task> get getTasks => _tasks;

  int get getLenght => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    // saveItemsToSharedPref(_tasks);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    // saveItemsToSharedPref(_tasks);
    notifyListeners();
  }

  void toggleStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    // saveItemsToSharedPref(_tasks);
    notifyListeners();
  }

  // Shared Pref Methods

  // Future<void> createPrefObject() async {
  //   _sharedPref = await SharedPreferences.getInstance();
  // }

  // void saveItemsToSharedPref(List<Task> tasks) {
  //   // _sharedPref.se

  //   _tasksAsString.clear();
  //   for (var task in tasks) {
  //     _tasksAsString.add(jsonEncode(task.toMap()));
  //   }

  //   _sharedPref!.setStringList("taskData", _tasksAsString);
  // }

  // void loadTaskFromSharedPref() {
  //   List<String> tempList = _sharedPref!.getStringList("taskData") ?? [];
  //   _tasks.clear();
  //   for (var task in tempList) {
  //     _tasks.add(Task.fromMap(jsonDecode(task)));
  //   }
  // }
}
