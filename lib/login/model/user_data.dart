
import 'dart:collection';

import 'package:flutter/material.dart';
import 'user.dart';

class UserData extends ChangeNotifier{
  final List<User> _user = []
    ..add(new User('toan','18/11/1997','Thai Nguyen','12345'))
    ..add(new User('hoang','1/2/2000','Thai Nguyen','12345'))
    ..add(new User('ducdn','18/11/1997','Ha Tinh','12345'));
  UnmodifiableListView<User> get getUser => UnmodifiableListView(_user);
}