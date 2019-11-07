import 'package:flutter/material.dart';

class Counter2 {
  int _count = 0;

  int get count => _count;
  increment() {
    _count++;
    _count++;
  }
}