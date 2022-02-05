import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'addNewTask': "Add new task!",
        },
        'tr_TR': {
          'addNewTask': "Yeni görev ekle!",
        }
      };
}
