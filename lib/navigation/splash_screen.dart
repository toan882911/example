import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/login/login.dart';
import 'package:flutter_test_textfield/navigation/home.dart';
import 'package:flutter_test_textfield/navigation/onboarding.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:splashscreen/splashscreen.dart' as prefix0;

class SplashDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white
      ),
      routes: {
        '/home': (BuildContext context) => Home(),
      },
      home: SplashScreenDemo(),
    );
  }
}

class SplashScreenDemo extends StatefulWidget {
  @override
  _SplashScreenDemoState createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
          seconds: 2,
          navigateAfterSeconds: new OnBoardingDemo(),
          title: new Text('Welcome In SplashScreen',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),),
          image: Image.asset('asset/logo-sunshine.png'),
          photoSize: 100,
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          onClick: ()=>print("Flutter Egypt"),
          loaderColor: Colors.red
      ),
    );
  }
}