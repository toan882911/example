
import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {

  @override
  _MyFadeInState createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
    );
    _animation = new Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_controller);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: Opacity(
        opacity: 0.5,
        child: Center(
          child: CircularProgressIndicator(
            semanticsValue: 'true',
            strokeWidth: 10.0,
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}