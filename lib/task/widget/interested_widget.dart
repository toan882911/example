import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
import 'list_item.dart';

class InterestedWidget extends StatefulWidget {
  @override
  _InterestedWidgetState createState() => _InterestedWidgetState();
}

class _InterestedWidgetState extends State<InterestedWidget> {
  List<TaskModel> data = []
    ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));
  @override
  Widget build(BuildContext context) {
    return ListItem(data,0);
  }
}