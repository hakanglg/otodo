import 'package:uuid/uuid.dart';

class Task {
  final String title;
  bool isDone;
  final String uuid;

  Task({required this.title, required this.isDone, required this.uuid});

  factory Task.create({required String title}) {
    return Task(title: title, uuid: const Uuid().v1(), isDone: false);
  }

  Task.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        isDone = map["isDone"],
        uuid = map["uuid"];

  Map<String, dynamic> toMap() =>
      {"title": title, "isDone": isDone, "uuid": uuid};
}
