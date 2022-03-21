// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksViewModel on _TasksViewModelBase, Store {
  final _$taskBoxAtom = Atom(name: '_TasksViewModelBase.taskBox');

  @override
  Box<Task> get taskBox {
    _$taskBoxAtom.reportRead();
    return super.taskBox;
  }

  @override
  set taskBox(Box<Task> value) {
    _$taskBoxAtom.reportWrite(value, super.taskBox, () {
      super.taskBox = value;
    });
  }

  final _$addTaskAsyncAction = AsyncAction('_TasksViewModelBase.addTask');

  @override
  Future<void> addTask(Task task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  final _$removeTaskAsyncAction = AsyncAction('_TasksViewModelBase.removeTask');

  @override
  Future<void> removeTask(int index) {
    return _$removeTaskAsyncAction.run(() => super.removeTask(index));
  }

  final _$_TasksViewModelBaseActionController =
      ActionController(name: '_TasksViewModelBase');

  @override
  dynamic changeStatus(int index) {
    final _$actionInfo = _$_TasksViewModelBaseActionController.startAction(
        name: '_TasksViewModelBase.changeStatus');
    try {
      return super.changeStatus(index);
    } finally {
      _$_TasksViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTask(int index, String value) {
    final _$actionInfo = _$_TasksViewModelBaseActionController.startAction(
        name: '_TasksViewModelBase.changeTask');
    try {
      return super.changeTask(index, value);
    } finally {
      _$_TasksViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskBox: ${taskBox}
    ''';
  }
}
