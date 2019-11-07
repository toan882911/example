import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_textfield/provider/widget/basic_provider.dart';
import 'counter.dart';
import 'widget/change.dart';
import 'package:flutter_test_textfield/provider/counter2.dart';
class DemoProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>.value(
          value: Counter(),
        ),
        Provider<Counter2>.value(value: Counter2()),
      ],
      child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Counter counter = Provider.of<Counter>(context);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DemoCounterConsumer(),
    );
  }
}
class DemoCounterConsumer extends StatelessWidget {
   RoundedRectangleBorder mRadiusBorder = RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(Radius.circular(8)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('abc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OutlineButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return ChangeProvider();
              }));
            },
            child: Text("change Demo"),
            shape: mRadiusBorder,
          ),
          OutlineButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return BasicProvider();
              }));
            },
            child: Text("provider Demo"),
            shape: mRadiusBorder,
          ),
        ],
      ),
    );
  }
}
