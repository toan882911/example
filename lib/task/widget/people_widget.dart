import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
import 'package:flutter_test_textfield/task/widget/people_widget_count.dart';
import '../data/model/department_model.dart';
import 'task_item_widget.dart';

class PeopleWidget extends StatefulWidget {
  final DepartmentModel currentDep;

  PeopleWidget(this.currentDep);

  @override
  _PeopleWidgetState createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  List<TaskModel> data = []
    ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
  ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
  ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));

  @override
  void didUpdateWidget(PeopleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentDep.title != oldWidget.currentDep.title) {
      print('MyTask Refresh Data');
      setState(() {
        data = []
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context ,index ) => TaskItemWidget(data[index],2),
    );
  }
}