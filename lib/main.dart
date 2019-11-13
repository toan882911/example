import 'package:flutter/material.dart';
import 'animation/fade_transition.dart';
import 'dio/github/custom_cache_interceptor.dart';
import 'dio/github/intercep_lock.dart';
import 'dio/github/proxy_interceptor.dart';
import 'dio/github/request_interceptors.dart';
import 'dio/github/response_interceptor.dart';
import 'dio/github/test.dart';
import 'dio/home.dart';
import 'login/home.dart';
import 'login/login.dart';
import 'provider/demo_provider.dart';

void main() => runApp(
    ProxyInterceptor()
);



