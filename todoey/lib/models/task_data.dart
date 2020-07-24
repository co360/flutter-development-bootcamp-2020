import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(taskText: 'Sample Task 1'),
    Task(taskText: 'Sample Task 2'),
    Task(taskText: 'Sample Task 3'),
  ];

  int get taskCount {
    return tasks.length;
  }
}