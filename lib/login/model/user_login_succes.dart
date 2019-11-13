
import 'dart:collection';
import 'package:flutter/material.dart';
import 'user.dart';

class UserLogin extends ChangeNotifier{
  List<User> _userLogin = [];
  UnmodifiableListView<User> get getUserLogin => UnmodifiableListView(_userLogin);
  void addUser(User user ){
    _userLogin.clear();
    _userLogin.add(user);
    notifyListeners();
  }
}