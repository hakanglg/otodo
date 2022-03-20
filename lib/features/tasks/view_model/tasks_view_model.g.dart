// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksViewModel on _TasksViewModelBase, Store {
  Computed<ObservableList<Task>>? _$taskListComputed;

  @override
  ObservableList<Task> get taskList => (_$taskListComputed ??=
          Computed<ObservableList<Task>>(() => super.taskList,
              name: '_TasksViewModelBase.taskList'))
      .value;
  Computed<int>? _$getLenghtComputed;

  @override
  int get getLenght =>
      (_$getLenghtComputed ??= Computed<int>(() => super.getLenght,
              name: '_TasksViewModelBase.getLenght'))
          .value;

  final _$_tasksAtom = Atom(name: '_TasksViewModelBase._tasks');

  @override
  ObservableList<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TasksViewModelBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_TasksViewModelBaseActionController =
      ActionController(name: '_TasksViewModelBase');

  @override
  void addTask(Task task) {
    final _$actionInfo = _$_TasksViewModelBaseActionController.startAction(
        name: '_TasksViewModelBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TasksViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo = _$_TasksViewModelBaseActionController.startAction(
        name: '_TasksViewModelBase.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$_TasksViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(int index) {
    final _$actionInfo = _$_TasksViewModelBaseActionController.startAction(
        name: '_TasksViewModelBase.changeStatus');
    try {
      return super.changeStatus(index);
    } finally {
      _$_TasksViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
taskList: ${taskList},
getLenght: ${getLenght}
    ''';
  }
}
