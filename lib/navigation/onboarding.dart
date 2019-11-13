import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/navigation/module/data.dart';
import 'package:flutter_test_textfield/navigation/module/page_indicator.dart';
import 'package:gradient_text/gradient_text.dart';

import 'home.dart';

class OnBoardingDemo extends StatefulWidget {
  @override
  _OnBoardingDemoState createState() => _OnBoardingDemoState();
}

class _OnBoardingDemoState extends State<OnBoardingDemo> with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF485563),Color(0xFF29323C)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0 , 1.0],
          tileMode: TileMode.clamp,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length -1 ){
                    lastPage = true;
                  } else {
                    lastPage = false;
                  }
                });
              },
              itemBuilder: (context , index){
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context,child){
                        var page = pageList[index];
                        var delta;
                        var y =1.0;
                        if (_controller.position.haveDimensions){
                          delta = _controller.page - index;
                          y = 1 - delta.abs().clamp(0.0,1.0);
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(page.imageUrl,height: 300,),
                            Container(
                              height: 100.0,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: .10,
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                          colors: page.titleGradient
                                      ),
                                      style: TextStyle(
                                        fontSize: 80.0,
                                        fontFamily: "Montserrat-Black",
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 28.0,left: 40.0),
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                          colors: page.titleGradient
                                      ),
                                      style: TextStyle(
                                        fontSize: 50.0,
                                        fontFamily: "Montserrat-Black",
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ),
                            Transform(
                              transform: Matrix4.translationValues(0 , 50.0 * (1-y), 0),
                              child: Text(
                                page.body,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Montserrat-Medium",
                                  color: Color(0xFF9B9B9B),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
            Positioned(
              left: 40.0,
              bottom: 40.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentPage,pageList.length),
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: lastPage ? FloatingActionButton(
                onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(
                      builder: (BuildContext context) => Home()
                  ));
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.forward , color: Colors.black,),
              ) : Container(),
            )
          ],
        ),
      ),
    );
  }
}