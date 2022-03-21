import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
part "task_model.g.dart";

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isDone;
  @HiveField(2)
  final String uuid;

  Task({required this.title, this.isDone = false, required this.uuid});

  factory Task.create({required String title}) {
    return Task(title: title, uuid: const Uuid().v1(), isDone: false);
  }

  // Task.fromMap(Map<String, dynamic> map)
  //     : title = map["title"],
  //       isDone = map["isDone"],
  //       uuid = map["uuid"];

  // Map<String, dynamic> toMap() =>
  //     {"title": title, "isDone": isDone, "uuid": uuid};

}
