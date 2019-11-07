import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../counter.dart';

class ChangeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context , counter , child) {
        print('render Consumer');
        return Center(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    counter.count.toString(),
                    style: TextStyle(fontSize: 40),
                  ),
                  RaisedButton(
                    onPressed: () {
                      counter.increment();
                    },
                    child: Text(
                      "Increment",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
