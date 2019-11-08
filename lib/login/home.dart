import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form.dart';
import 'model/user.dart';
import 'model/user_login_succes.dart';

class Home extends StatelessWidget {
  String name,birth,address;
  @override
  Widget build(BuildContext context) {
    UserLogin userLogin = Provider.of<UserLogin>(context);
    userLogin.getUserLogin.forEach((value){
      name = value.name;
      birth = value.birth;
      address = value.address;
    });
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Username : '),
                      ),
                      Expanded(
                        child: Text(name),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Birth Day : '),
                      ),
                      Expanded(
                        child: Text(birth),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Address : '),
                      ),
                      Expanded(
                        child: Text(address),
                      ),
                    ],
                  ),
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
                        })).then((value){
                          if(value != null){
                            userLogin.addUser(value);
                          }
                        });
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
