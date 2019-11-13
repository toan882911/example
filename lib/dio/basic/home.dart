import 'package:flutter/material.dart';

import 'dio.dart';
class Dio extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: 'abc',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    DioApi dioApi = DioApi();
    dioApi.getUser();
    return Scaffold(
      appBar: AppBar(
        title: Text('abc'),
      ),
      body: Text(''),
    );
  }
}
