
import 'dart:collection';

import 'package:flutter/material.dart';
import 'user.dart';

class UserData extends ChangeNotifier{
  final List<User> _user = [];
  UnmodifiableListView<User> get getUser => UnmodifiableListView(_user);
  void addUser(User user ){
    _user.clear();
    _user.add(user);
    notifyListeners();
  }
}