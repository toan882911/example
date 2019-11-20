import 'package:flutter/material.dart';
import '../data/model/task_model.dart';
import 'task_item_widget.dart';

class PeopleWidgetCount extends StatefulWidget {
  final  List<TaskModel> data;
  final int number;
  PeopleWidgetCount(this.data,this.number);

  @override
  _PeopleWidgetCountState createState() => _PeopleWidgetCountState();
}

class _PeopleWidgetCountState extends State<PeopleWidgetCount> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.number > 0 ? widget.number : widget.data.length,
      itemBuilder: (context ,index ) => TaskItemWidget(widget.data[index],2),
    );
  }
}
