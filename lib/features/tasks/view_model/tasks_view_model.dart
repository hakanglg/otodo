import 'package:mobx/mobx.dart';

import '../../model/task_model.dart';

part 'tasks_view_model.g.dart';

class TasksViewModel = _TasksViewModelBase with _$TasksViewModel;

abstract class _TasksViewModelBase with Store {
  @observable
  ObservableList<Task> _tasks = ObservableList<Task>();

  @observable
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
}
