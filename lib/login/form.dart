import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';
import 'model/user_login_succes.dart';

class FormPage extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}
class _FormState extends State<FormPage> {
  String name,birth,address,pass;
  GlobalKey<FormState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    UserLogin userLogin = Provider.of<UserLogin>(context);
    List<Widget> widgets = [];
    userLogin.getUserLogin.forEach((value){
      widgets.add(Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text('Username : '),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Không được để trống';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value){
                    name = value;
                  },
                  onChanged: (value){
                    name = value;
                  },
                  initialValue: value.name,
                ),
              ),
            ],
          ),
        ),);
      widgets.add(Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text('Birth Day : '),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Không được để trống';
                  } else {
                    return null;
                  }
                },
                onSaved: (value){
                  birth = value;
                },
                onChanged: (value){
                  birth = value;
                },
                initialValue: value.birth,
              ),
            ),
          ],
        ),
      ),);
      widgets.add( Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text('Address : '),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Không được để trống';
                  } else {
                    return null;
                  }
                },
                onSaved: (value){
                  address = value;
                },
                onChanged: (value){
                  address = value;
                },
                initialValue: value.address,
              ),
            ),
          ],
        ),
      ),);
      widgets.add(Expanded(
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
            child: Text('Save Information',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            onPressed: (){
              if(!_globalKey.currentState.validate()) {
                print('error');
              } else {
                _globalKey.currentState.save();
                print(name +' '+ birth +' '+ address +' '+ pass);
                Navigator.of(context).pop(new User(name,birth,address,pass));
              }
            },
          ),
        ),
      ),);
    });
    userLogin.getUserLogin.forEach((value){
      name = value.name;
      birth = value.birth;
      address = value.address;
      pass = value.pass;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _globalKey,
        child: Center(
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
                children: widgets,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
