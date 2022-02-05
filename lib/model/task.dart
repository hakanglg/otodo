import 'package:uuid/uuid.dart';

class Task {
  String title;
  bool isDone;
  String uuid;

  Task({required this.title, required this.isDone, required this.uuid});

  factory Task.create({required String title}) {
    return Task(title: title, uuid: const Uuid().v1(), isDone: false);
  }
//   void toggleCompleted() {
//     isDone = !isDone;
//   }
}
