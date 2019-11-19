
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class PositionedTransitions extends StatefulWidget {
  @override
  _PositionedTransitionsState createState() => _PositionedTransitionsState();
}

class _PositionedTransitionsState extends State<PositionedTransitions> with SingleTickerProviderStateMixin{
  final RelativeRectTween relativeRectTween = RelativeRectTween(
      begin: RelativeRect.fromLTRB(40.0, 40.0, 0, 0),
      end: RelativeRect.fromLTRB(0, 0, 40.0, 40.0)
  );
  AnimationController animationController;
  bool _firts = true;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.blue[50],
            height: 300,
            child: Stack(
              children: <Widget>[
                PositionedTransition(
                  rect: relativeRectTween.animate(animationController),
                  child: Container(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      padding: EdgeInsets.all(20),
                      child: FlutterLogo(),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(
            onPressed: (){
              if (_firts){
                animationController.forward();
              } else {
                animationController.reverse();
              }
              _firts = !_firts;
            },
            child: Text('Click Me'),
          )
        ],
      ),
    );
  }
}