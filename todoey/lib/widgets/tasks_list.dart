import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          taskText: Provider.of<TaskData>(context).tasks[index].taskText,
          isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
//          checkboxCallback: (bool checkboxState) {
//            setState(() {
//              widget.tasks[index].toggleDone();
//            });
//          }
      );
    },
    itemCount: widget.tasks.length,
    );
  }
}

