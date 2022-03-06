import 'package:hive_flutter/hive_flutter.dart';

import '../../features/model/task_model.dart';

class Boxes {
  static Box<Task> getTaskBox() => Hive.box<Task>("taskBox");
}
