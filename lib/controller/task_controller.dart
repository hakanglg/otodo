import 'package:get/state_manager.dart';

import '../model/task.dart';

class TaskController extends GetxController {
  final _tasks = <Task>[].obs;

  int get getLenght => tasks.length;

  get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
} 









// import 'package:uuid/uuid.dart';
// import 'task.dart';

// class TaskData extends GetxController {
//   List<Task> _tasks = [
//     Task(title: "Task 1", uuid: Uuid().v1()),
//     Task(title: "Task 2", isDone: true, uuid: Uuid().v1()),
//     Task(title: "Task 3", uuid: Uuid().v1()),
//     Task(title: "Task 4", isDone: true, uuid: Uuid().v1())
//   ].obs;

//   void addTask(String title) {
//     _tasks.add(Task(title: title, uuid: Uuid().v1()));
//     update();
//   }

//   void change(TextEditingController controller, int index) {
//     _tasks[index].title = controller.text;
//   }

//   void deleteTask(int index) {
//     _tasks.removeAt(index);
//   }

//   void toggleStatus(int index) {
//     // _tasks[index].toggleCompleted();
//     _tasks[index].isDone = !_tasks[index].getDone;
//     update();
//   }

//   int get taskCount => _tasks.length;
//   List<Task> get tasks => _tasks;
// }
