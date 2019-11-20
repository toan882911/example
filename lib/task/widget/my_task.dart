import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/department_model.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';
import 'task_item_widget.dart';

class MyTask extends StatefulWidget {

  final DepartmentModel currentDep;

  MyTask(this.currentDep);

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> with AutomaticKeepAliveClientMixin{
  List<TaskModel> data = []
    ..add(TaskModel('Viết module nhận diện khuân mặt ','06/11/2019','Hoàn thành',3 ,4,4))
    ..add(TaskModel('Kiểm tra phần module cho lễ tân  ','19/08/2019','Đang thực hiện',1 ,2,2))
    ..add(TaskModel('Chi tiết hàng rào dự án \n jjkk \n jjjjjj \n jhjhjhj\nrào dự án \n jjkk \n jjjjjj \n jhjhjhj','17/09/2019','Chưa làm',2 ,0,1))
    ..add(TaskModel('Tài liệu hướng dẫn xây dựng thi công ','19/09/2019','Đang thực hiện',2,1,3))
    ..add(TaskModel('Tài liệu hướng dẫn xây dựng thi công ','19/09/2019','Đang thực hiện',2,2,3))
    ..add(TaskModel('Tài liệu hướng dẫn xây dựng thi công ','19/09/2019','Đang thực hiện',2,1,3))
    ..add(TaskModel('Viết module nhận diện khuân mặt ','06/11/2019','Hoàn thành',2 ,4,4));


  @override
  void didUpdateWidget(MyTask oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentDep.title != oldWidget.currentDep.title) {
      print('MyTask Refresh Data');
      setState(() {
        data = []
          ..add(TaskModel('${widget.currentDep.title}','06/11/2019','Hoàn thành',3 ,4,4))
          ..add(TaskModel('Viết module nhận diện khuân mặt ','06/11/2019','Hoàn thành',3 ,4,4))
          ..add(TaskModel('Kiểm tra phần module cho lễ tân  ','19/08/2019','Đang thực hiện',1 ,2,2))
          ..add(TaskModel('Chi tiết hàng rào dự án \n jjkk \n jjjjjj \n jhjhjhj\nrào dự án \n jjkk \n jjjjjj \n jhjhjhj','17/09/2019','Chưa làm',2 ,0,1))
          ..add(TaskModel('Tài liệu hướng dẫn xây dựng thi công ','19/09/2019','Đang thực hiện',2,1,3))
          ..add(TaskModel('Tài liệu hướng dẫn xây dựng thi công ','19/09/2019','Đang thực hiện',2,2,3))
          ..add(TaskModel('Tài liệu hướng dẫn xây dựng thi công ','19/09/2019','Đang thực hiện',2,1,3))
          ..add(TaskModel('Viết module nhận diện khuân mặt ','06/11/2019','Hoàn thành',2 ,4,4));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('MyTask Build');
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context ,index ) => TaskItemWidget(data[index],0),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}