import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}