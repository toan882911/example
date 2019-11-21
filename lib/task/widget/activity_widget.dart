import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/activity_model.dart';
import 'package:flutter_test_textfield/task/widget/activity_item_widget.dart';

class ActivityWidget extends StatefulWidget {

  final ActivityModel activity;

  ActivityWidget(this.activity);

  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  List<ActivityModel> data =
  []..add(ActivityModel('Admin ','1 ngày trước','','',''))
    ..add(ActivityModel('Admin','2 ngày trước','asset/logo-sunshine.png','','B'))
    ..add(ActivityModel('AdminOffice','2 ngày trước','Xay dung tai lieu huong dan su dung','','C'))
    ..add(ActivityModel('Do Duc','9 ngày trước','Thuc hien nghiem tuc hop dong 110234 ljlasjd lakdja asldjas','','D'))
    ..add(ActivityModel('AdminOffice','10 ngày trước','asset/splash-screen.png','','E'));

  @override
  void didUpdateWidget(ActivityWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index) => ActivityItemWidget(data[index]),
      ),
    );
  }
}