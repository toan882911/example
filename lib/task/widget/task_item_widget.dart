import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';

class TaskItemWidget extends StatefulWidget {

  final TaskModel model;

  TaskItemWidget(this.model);

  @override
  _TaskItemWidgetState createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.model.title),
      subtitle: Text(widget.model.date),
    );
  }
}