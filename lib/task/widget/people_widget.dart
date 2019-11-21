import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
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
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1))
          ..add(TaskModel('Xây dựng tài liệu sử dụng ','30/08/2019','Hoàn thành',2 ,2,1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context ,index ) {
          if(index < 2) {
            return TaskItemWidget(data[index]);
          } else {
            return   Container(
              height: 40.0,
              margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5,color: Colors.grey[400]),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Center(
                child: Text('Xem thêm'),
              ),
            );
          }
        },

    );
  }
}