import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/task_tile.dart'; // Check your path
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/task_data.dart'; // Check your path

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This 'Consumer' widget is the key.
    // It listens for changes in your TaskData and rebuilds the list.
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        // ListView.builder is the efficient way to build a list.
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            // It creates a TaskTile for each task
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                // This updates the task when you tap the checkbox
                taskData.updateTask(task);
              },
              longPressCallback: () {
                // This deletes the task when you long-press
                taskData.deleteTask(task);
              },
            );
          },
          // This tells the list how many items to build
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}