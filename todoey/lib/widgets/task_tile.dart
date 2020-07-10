import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final String taskText;
  final bool isChecked;
  final Function checkboxCallback;

  TaskTile({@required this.taskText, @required this.isChecked, @required this.checkboxCallback});


  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskText,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            value: isChecked,
            activeColor: Colors.lightBlueAccent,
            onChanged: checkboxCallback
        )
    );
  }
}