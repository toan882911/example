import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/activity_model.dart';
import 'package:path/path.dart' as p;

class ActivityItemWidget extends StatefulWidget {
  final ActivityModel activity;

  ActivityItemWidget(this.activity);

  @override
  _ActivityItemWidgetState createState() => _ActivityItemWidgetState();
}

class _ActivityItemWidgetState extends State<ActivityItemWidget> {
  bool checkActivity(String data) {
    if (p.extension(data) == ".png") {
      print(p.extension(data));
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.message,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: RichText(
                  text: TextSpan(
                    text: '',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: '${widget.activity.userName} ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'đã thêm tập tin ',
                      ),
                      TextSpan(
                          text: '${widget.activity.activity}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
                Text(
                  '${widget.activity.time}',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[400]),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                      ),
                      border: Border.all(width: 0.1, color: Colors.black)),
                  child: checkActivity(widget.activity.activity)
                      ? Container(
                          child: Image.asset(
                            "${widget.activity.activity}",
                            fit: BoxFit.fill,
                            width: 80.0,
                            height: 80.0,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '${widget.activity.activity}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
