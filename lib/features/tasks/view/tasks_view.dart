import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:otodo/core/init/theme/dark_theme.dart';
import 'package:otodo/core/init/theme/light_theme.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/base/base_state.dart';
import '../../../core/components/text/locale_text.dart';
import '../../../widgets/button/custom_elevated_button.dart';
import '../../providers/theme_provider.dart';
import '../view_model/tasks_view_model.dart';
import '../../../widgets/fab/add_fab.dart';
import '../model/task_model.dart';

part 'tasks_string_values.dart';

class TasksView extends StatelessWidget with BaseState {
  final _model = TasksViewModel();

  _TasksStringValues values = _TasksStringValues();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
        floatingActionButton: AddTaskFABButton(),
        appBar: AppBar(
            title: Image.asset(
              themeProvider.themeData == darkTheme
                  ? ApplicationConstants.LOGO_DARK_PATH
                  : ApplicationConstants.LOGO_LIGHT_PATH,
              fit: BoxFit.fitWidth,
            ),
            actions: [
              Padding(
                  padding: context.horizontalPaddingNormal,
                  // child: changeTheme(context),
                  child: themeProvider.themeData == darkTheme
                      ? ElevatedThemeButton(
                          themeData: lightTheme, icon: Icons.light_mode)
                      : ElevatedThemeButton(
                          themeData: darkTheme, icon: Icons.dark_mode))
            ]),
        body: ValueListenableBuilder(
          valueListenable: _model.taskBox.listenable(),
          builder: (context, Box<Task> box, _) {
            if (box.isEmpty) {
              return emptyText();
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return dismissibleWidget(context, index, box);
                  });
            }
          },
        ));
  }

  Center emptyText() {
    return const Center(child: LocaleText(text: LocaleKeys.emptyTodo));
  }

  Dismissible dismissibleWidget(
      BuildContext context, int index, Box<Task> box) {
    return Dismissible(
      background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Padding(
            padding: context.horizontalPaddingNormal,
            child: Icon(
              Icons.delete,
              color: colorConstants.white,
            ),
          )),
      onDismissed: (direction) => _model.removeTask(index),
      key: UniqueKey(),
      child: taskListTileSection(box, index, context),
    );
  }

  ListTile taskListTileSection(Box<Task> box, int index, BuildContext context) {
    return ListTile(
        onTap: () => _model.changeStatus(index),
        title: titleText(box, index, context),
        trailing: trailingIconButton(index, box, context));
  }

  Text titleText(Box<Task> box, int index, BuildContext context) {
    return Text(
      box.getAt(index)!.title,
      style: box.getAt(index)!.isDone
          ? context.textTheme.bodyText1
          : context.textTheme.bodyText2,
    );
  }

  IconButton trailingIconButton(
      int index, Box<Task> box, BuildContext context) {
    return IconButton(
        onPressed: () => _model.changeStatus(index),
        icon: box.getAt(index)!.isDone
            ? completedIcon()
            : notCompletedIcon(context));
  }

  Icon notCompletedIcon(BuildContext context) {
    return Icon(
      Icons.circle_outlined,
      color: context.appTheme.iconTheme.color,
    );
  }

  Icon completedIcon() {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
    );
  }
}
