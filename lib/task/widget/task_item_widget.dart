import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';

class TaskItemWidget extends StatefulWidget {

  final TaskModel model;
  TaskItemWidget(this.model);

  @override
  _TaskItemWidgetState createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {

  List<Widget> containerItem(){
    List<Widget> widgets = [];
    for ( int i = 0 ; i < widget.model.container ; i++){
      widgets.add(
          Container(
            margin: EdgeInsets.all(4.0),
            width: 52.0,
            height: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(1.0))
            ),
          )
      );
    }
    return widgets;
  }

  List<Widget> iconItem(){
    List<Widget> widgets = [];
    for ( int i = 0 ; i < widget.model.icon; i++){
      widgets.add(
        Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: CircleAvatar(
            radius: 20.0,
            child: Text('A'),
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5,color: Colors.grey[400])
              )
          ),
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: containerItem(),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text('${widget.model.title}'),
                      SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 24.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(4.0))
                            ),
                            child: Center(
                              child: Text('${widget.model.date}',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Icon(Icons.attach_file),
                          Text('${widget.model.file}'),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))
                      ),
                      child: Center(
                        child: Text('${widget.model.status}',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: iconItem(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}