import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
import '../data/model/department_model.dart';
import 'task_item_widget.dart';

class TaskWidget extends StatefulWidget {
  final DepartmentModel currentDep;
  TaskWidget(this.currentDep);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  List<TaskModel> data = []
    ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
    ..add(TaskModel('Nhiệm vụ cho hôf sơ dự án ','15/11/2019','Đang thực hiện',0 ,2,2))
    ..add(TaskModel('Làm lại hồ sơ ','15/11/2019','Chưa làm',2 ,0,1))
    ..add(TaskModel('Xây dựng tài liệu hướng dẫn','10/11/2019','Đang thực hiện',1,1,1));

  @override
  void didUpdateWidget(TaskWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentDep.title != oldWidget.currentDep.title) {
      print('MyTask Refresh Data');
      setState(() {
        data = []
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
          ..add(TaskModel('Nhiệm vụ cho hôf sơ dự án ','15/11/2019','Đang thực hiện',0 ,2,2))
          ..add(TaskModel('Làm lại hồ sơ ','15/11/2019','Chưa làm',2 ,0,1))
          ..add(TaskModel('Xây dựng tài liệu hướng dẫn','10/11/2019','Đang thực hiện',1,1,1));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context ,index ) => TaskItemWidget(data[index]),
    );
  }
}

