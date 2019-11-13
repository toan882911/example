
import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/login/model/user.dart';

class UserBloc extends ChangeNotifier {

  User userInfo;

  //Danh cho case login
  setCurrentUser(User user) {
    userInfo = user;
    notifyListeners();
  }


  //Danh cho case Update
  updateCurrentUser(User user) {
    userInfo = user;
    notifyListeners();
  }

}