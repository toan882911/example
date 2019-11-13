import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/bloc/user_bloc.dart';
import 'package:provider/provider.dart';
import 'form.dart';
import 'model/user.dart';
import 'model/user_login_succes.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = Provider.of(context);
    Widget detailUser(Widget detail1,Widget detail2){
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: detail1,
            ),
            Expanded(
              child: detail2,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,),
          child: Container(
            height: 300.0,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                detailUser(
                  Text('Username : '),
                  Text(userBloc.userInfo?.name),
                ),
                detailUser(
                  Text('Birth Day : '),
                  Text(userBloc.userInfo?.birth),
                ),
                detailUser(
                  Text('Address : '),
                  Text(userBloc.userInfo?.address),
                ),
                Expanded(
                  child: Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.only(top: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: FlatButton(
                      color: Colors.blueAccent,
                      child: Text('Edit User',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                      onPressed: (){
                        Navigator.of(context).push<User>(MaterialPageRoute( builder: (context){
                          return FormPage();
                        }));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

