import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
import 'package:flutter_test_textfield/task/widget/view_list_item.dart';

class ListItem extends StatefulWidget {

  ListItem(this.data,this.number);
  final List<TaskModel> data;
  final int number;

  @override
  _ListItemState createState() => _ListItemState(data,number);
}

class _ListItemState extends State<ListItem> {

  _ListItemState(this.data,this.number);
  List<TaskModel> data;
  final int number;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: number > 0 ? number : data.length,
      itemBuilder: (context ,index ) => ViewListItem(data,index,number),
    );
  }
}