import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/task.dart'; // Make sure this path is correct!
import 'dart:collection';

class TaskData extends ChangeNotifier {
  // Private list that holds all tasks.
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  // A public "getter" that lets other widgets *view* the list,
  // but not add to it directly.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // A public "getter" for the number of tasks.
  int get taskCount {
    return _tasks.length;
  }

  // This is how new tasks are added from other screens (like AddTaskScreen).
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    // This is the most important line! It tells all listening widgets
    // to rebuild themselves because the data has changed.
    notifyListeners();
  }

  // This updates the checkbox state of a task.
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // This deletes a task from the list.
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}