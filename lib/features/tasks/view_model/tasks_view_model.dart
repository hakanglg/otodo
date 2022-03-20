import 'package:mobx/mobx.dart';

import '../../model/task_model.dart';

part 'tasks_view_model.g.dart';

class TasksViewModel = _TasksViewModelBase with _$TasksViewModel;

abstract class _TasksViewModelBase with Store {
  @observable
  ObservableList<Task> _tasks = ObservableList<Task>();

  @observable
  bool loading = false;

  @computed
  ObservableList<Task> get taskList => _tasks;

  @computed
  int get getLenght => _tasks.length;

  @action
  void addTask(Task task) {
    _tasks.add(task);
    print(task.title);
  }

  @action
  void removeTask(int index) {
    _tasks.removeAt(index);
  }

  @action
  void changeStatus(int index) {
    // _tasks[index].toggleStatus();
    _tasks[index].isDone = !_tasks[index].isDone;
    // var box = Hive.box<Task>("taskBox");
    //       box.add(newTask);
    // taskList[index].isDone = !taskList[index].isDone;
    // print(_tasks[index].isDone);
  }
}
