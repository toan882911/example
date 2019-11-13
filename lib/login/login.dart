import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/bloc/user_bloc.dart';
import 'package:flutter_test_textfield/login/model/user_login_succes.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'model/user.dart';
import 'model/user_data.dart';
class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.deepPurple[900],
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  GlobalKey<FormState> _keyForm = GlobalKey();
  UserBloc userBloc;

  //region form
  bool _obscureText = true;
  List<String> error = [];
  List<String> errorLogin = [];
  String user;
  String pass;
  //endregion”

  void hideShowPass(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //Return list widget Error info
  List<Widget> getErrorWidgets() {
    List<Widget> errors = [];
    error.forEach((value){
      errors.add(Text(value));
    });
    errorLogin.forEach((value){
      errors.add(Text(value));
    });
    return errors;
  }

  void checkLogin(context){
    errorLogin.clear();
    if(user == "toan" && pass == "12345"){
      userBloc.setCurrentUser(User('toan', '11/11/1999', 'HN', ''));
      Navigator.of(context).push(MaterialPageRoute( builder: (context){
        return Home();
      }));
    } else {
      setState(() {
        errorLogin.add('Tài khoản hoặc mật khẩu sai');
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userBloc = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _keyForm,
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
                                validator: (value) {
                                  if (!value.contains(
                                      new RegExp(r'[A-Za-z0-9]'))
                                      && value.isEmpty ) {
                                    error.add('Tên đăng nhập chỉ bao gồm chữ và so');
                                    return null;
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value){
                                  user = value;
                                },
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
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 4.0),
                                  hintText: 'Mật khẩu',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                validator: (value){
                                  if(value.isEmpty){
                                    error.add('Mật khẩu hông được để trống');
                                    return null;
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value){
                                  pass = value;
                                },
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.only(right: 4.0),
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: (){
                                hideShowPass();
                              },
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
                      error.isNotEmpty || errorLogin.isNotEmpty ? Container(
                        height: 52.0,
                        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        decoration: BoxDecoration(
                            color: Colors.yellowAccent[100],
                            borderRadius: BorderRadius.all(Radius.circular(8.0))
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: getErrorWidgets(),
                              ),
                            ),
                          ],
                        ),
                      ) : Container(),
                      FlatButton(
                        onPressed: (){
                          error.clear();
                          _keyForm.currentState.validate();
                          if (error.isEmpty) {
                            _keyForm.currentState.save();
                            checkLogin(context);
                            //TODO: Request API
                          } else {
                            setState((){});
                          }
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