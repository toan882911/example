import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.deepPurple[900],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool _obscureText = true;
  bool check = true;
  void hideShowPass(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                child: Container(
                  child: Center(
                    child: Image.asset(
                      'asset/logo-sunshine.png',
                      width: 200.0,
                      height: 30.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.0 ,color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
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
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                flex: 9,
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
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText,
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
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  padding: EdgeInsets.only(right: 4.0),
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: (){
                                    hideShowPass();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      check ? Container(
                        height: 52.0,
                        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent[100],
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Tên đăng nhập chỉ bao gồm chữ và số.'),
                                  Text('Mật khẩu không được để trống'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ) : Container(),
                      FlatButton(
                        onPressed: (){
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}