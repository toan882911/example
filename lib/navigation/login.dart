import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title ,this.prefs}) : super(key: key);
  final String title;
  SharedPreferences prefs;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 240.0,
                alignment: Alignment.center,
                child: Image.asset(
                  'asset/logo-sunshine.png',
                  width: 200.0,
                  height: 30.0,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0 ,color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Colors.grey[400],
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 4.0),
                                  hintText: 'Tên truy cập',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 4.0),
                                hintText: 'Mật khẩu',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(right: 4.0),
                            icon: Icon(Icons.remove_red_eye),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        widget.prefs.setBool('login', true);
                        Navigator.of(context).push(MaterialPageRoute( builder: (context){
                          return Home();
                        }));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}