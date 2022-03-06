import 'package:flutter_test/flutter_test.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() async {
    Hive.init("database");
  });
  test("Name Box Create and Put", () async {
    final box = await Hive.openBox<String>("otodo");
    await box.add("hakan");
  });
}
