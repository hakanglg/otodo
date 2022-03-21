import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../../../main.dart';
import '../../model/task_model.dart';

part 'tasks_view_model.g.dart';

class TasksViewModel = _TasksViewModelBase with _$TasksViewModel;

abstract class _TasksViewModelBase with Store {
  @observable
  Box<Task> taskBox = Hive.box(taskBoxString);

  // @observable
  // ObservableList<Task> _tasks = ObservableList<Task>();

  // @observable
  // bool loading = false;

  // @computed
  // ObservableList<Task> get taskList => _tasks;

  // @computed
  // int get getLenght => _tasks.length;

  @action
  Future<void> addTask(Task task) async {
    // _tasks.add(task);
    // print(task.title);
    if (task.title.length > 0) {
      await taskBox.add(task);
    } else {}
  }

  @action
  Future<void> removeTask(int index) async {
    // await _tasks.removeAt(index);
    await taskBox.deleteAt(index);
  }

  @action
  changeStatus(int index) {
    var i = taskBox.getAt(index);
    i!.isDone = !i.isDone;
    i.save();
  }

  
  @action
  changeTask(int index, String value) {
    var i = taskBox.getAt(index);
    i!.title = value;
    i.save();
  }
}
