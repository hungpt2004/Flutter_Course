import 'package:flutter/material.dart';
import 'package:flutter_todo_provider/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final taskItem = taskData.tasks[index];

          return TaskTile(
            isChecked: taskItem.isDone,
            taskTitle: taskItem.name,
            checkboxCallback: (bool? checkboxState) {
              taskData.updateTask(taskItem);
            },
            longPressCallback: () {
              taskData.deleteTask(taskItem);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
