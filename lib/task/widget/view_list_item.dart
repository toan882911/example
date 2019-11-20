import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/task_model.dart';

class ViewListItem extends StatelessWidget {

  ViewListItem(this.data,this.index,this.number);
  final List<TaskModel> data;
  final int index,number;

  List<Widget> containerItem(){
    List<Widget> widgets = [];
    for ( int i = 0 ; i < data[index].container ; i++){
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
    for ( int i = 0 ; i < data[index].icon; i++){
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
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5,color: Colors.grey[400])
              )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 3,
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
                    Text('${data[index].title}'),
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
                            child: Text('${data[index].date}',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(Icons.attach_file),
                        Text('${data[index].file}'),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      margin: EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))
                      ),
                      child: Center(
                        child: Text('${data[index].status}',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: iconItem(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        number > 0 ?
        Container(
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
        ) : Container() ,
      ],
    );
  }
}
