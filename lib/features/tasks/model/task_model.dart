import 'package:hive_flutter/adapters.dart';

import '../../../core/constants/app/hive_constants.dart';
part "task_model.g.dart";

@HiveType(typeId: HiveConstants.TaskBox)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isDone;
  @HiveField(2)
  final String uuid;

  Task({required this.title, this.isDone = false, required this.uuid});
}
