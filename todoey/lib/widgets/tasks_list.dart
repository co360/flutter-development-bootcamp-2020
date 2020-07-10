import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  List<Task> tasks = [
    Task(taskText: 'Sample Task1'),
    Task(taskText: 'Sample Task2'),
    Task(taskText: 'Sample Task3'),
  ];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          taskText: tasks[index].taskText,
          isChecked: tasks[index].isDone,
          checkboxCallback: (bool checkboxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          }
      );
    },
    itemCount: tasks.length,
    );
  }
}

