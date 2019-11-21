import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/constrain.dart';
import 'package:flutter_test_textfield/task/data/model/activity_model.dart';
import 'package:flutter_test_textfield/task/widget/activity_widget.dart';
import 'package:flutter_test_textfield/task/widget/my_task.dart';

import 'data/model/department_model.dart';
import 'widget/department_search_widget.dart';
import 'widget/interested_widget.dart';
import 'widget/people_widget.dart';
import 'widget/task_widget.dart';

class HomeTask extends StatefulWidget {
  @override
  _HomeTaskState createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> with SingleTickerProviderStateMixin{

  DepartmentModel department = DepartmentModel('Ban Lãnh Đạo', false);

  ActivityModel activity;

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Material(
          color: Colors.deepPurple,
          child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSizePaddingBar),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push<DepartmentModel>(MaterialPageRoute(builder: (context){
                                  return DepartmentSearchWidget(department);
                                  })).then((value){
                                    if (value != null) {
                                      setState(() {
                                        department = value;
                                      });
                                    }
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Phòng Ban',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      department.title,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: kHeightTabBar,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400].withOpacity(0.5),
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child: TabBar(
                      controller: controller,
                      indicatorWeight: 2.0,
                      isScrollable: true,
                      labelColor: Colors.deepPurpleAccent,
                      indicatorColor: Colors.deepPurpleAccent,
                      unselectedLabelColor: Colors.grey[400],
                      tabs: <Widget>[
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Nhiệm vụ của tôi'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Nhiệm vụ '),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Quan tâm '),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Theo người  '),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Theo dự án '),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Hoạt động '),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
        preferredSize: Size.fromHeight(kSizeBar + kHeightTabBar),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          MyTask(department),
          TaskWidget(department),
          InterestedWidget(department),
          PeopleWidget(department),
          Container(),
          ActivityWidget(activity),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
