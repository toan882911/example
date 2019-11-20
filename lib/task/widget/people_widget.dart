
import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';

import 'list_item.dart';

class PeopleWidget extends StatefulWidget {
  @override
  _PeopleWidgetState createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  List<TaskModel> data = []
    ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
  ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
  ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));
  @override
  Widget build(BuildContext context) {
    return ListItem(data,2);
  }
}