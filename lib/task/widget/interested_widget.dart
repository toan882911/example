import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
import '../data/model/department_model.dart';
import 'task_item_widget.dart';

class InterestedWidget extends StatefulWidget {
  final DepartmentModel currentDep;
  InterestedWidget(this.currentDep);

  @override
  _InterestedWidgetState createState() => _InterestedWidgetState();
}

class _InterestedWidgetState extends State<InterestedWidget> {
  List<TaskModel> data = []
    ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));

  @override
  void didUpdateWidget(InterestedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentDep.title != oldWidget.currentDep.title) {
      print('MyTask Refresh Data');
      setState(() {
        data = []..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context ,index ) => TaskItemWidget(data[index],0),
    );
  }
}