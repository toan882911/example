import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/navigation/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animation/animate_page.dart';
import 'animation/cache_images.dart';
import 'animation/fade_transition.dart';
import 'animation/physics_simulation.dart';
import 'dio/github/custom_cache_interceptor.dart';
import 'dio/github/intercep_lock.dart';
import 'dio/github/proxy_interceptor.dart';
import 'dio/github/request_interceptors.dart';
import 'dio/github/response_interceptor.dart';
import 'dio/github/test.dart';
import 'dio/home.dart';
import 'login/home.dart';
import 'login/login.dart';
import 'navigation/shared_preferences.dart';
import 'provider/demo_provider.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(home: CacheImages()));
}



