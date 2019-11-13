import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatelessWidget {
  SharedPreferencesDemo(this.prefs);
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: _incrementCounter,
            child: Text('Increment Counter'),
          ),
        ),
      ),
    );
  }
  _incrementCounter() async {
    await prefs.setInt('counter', 10);
    print(prefs.getInt('counter'));
  }
}
