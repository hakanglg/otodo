// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:otodo/features/model/task_model.dart';


// import 'package:mobx/mobx.dart';
// part 'tasks_model.g.dart';

// class TasksViewModel = _TasksViewModelBase with _$TasksViewModel;

// abstract class _TasksViewModelBase with Store {
  
// }

// class Tasks extends ChangeNotifier {
//   List<Task> _tasks = [];

//   final String taskBoxName = "taskBox";

//   late Future<Box<Task>> box = Hive.openBox<Task>(taskBoxName);

//   // List<String> _tasksAsString = [];

//   UnmodifiableListView<Task> get getTasks => UnmodifiableListView(_tasks);
//   // List<Task> get getTasks => _tasks;

//   // add list in box

//   Future<void> addBoxList() async {
//     final box = await Hive.openBox<Task>(taskBoxName);
//     await box.clear();
//     await box.addAll(_tasks);
//     notifyListeners();
//   }

//   int get getLenght => _tasks.length;

//   void addTask(Task task) {
//     _tasks.add(task);
//     notifyListeners();
//   }

//   Future<void> removeTask(int index) async {
//     await _tasks.removeAt(index);
//     addBoxList();
//     // saveItemsToSharedPref(_tasks);

//     notifyListeners();
//   }

//   Future<void> toggleStatus(int index) async {
//     _tasks[index].isDone = await !_tasks[index].isDone;
//     addBoxList();
//     notifyListeners();
//   }
// ----
  // Future<List<Task>> getItem() async {
  //   final box = await Hive.box<Task>("taskBox");

  //   return box.values.toList();
  //   notifyListeners();
  // }

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
// }
