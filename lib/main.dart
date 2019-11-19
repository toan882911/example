import 'dart:io';
import 'dart:developer' as developer;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' as prefix0;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/navigation/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animation/animate_page.dart';
import 'animation/cache_images.dart';
import 'animation/fade_transition.dart';
import 'animation/flaw.dart';
import 'animation/physics_simulation.dart';
import 'animation/positioned_transition.dart';
import 'dio/github/custom_cache_interceptor.dart';
import 'dio/github/intercep_lock.dart';
import 'dio/github/proxy_interceptor.dart';
import 'dio/github/request_interceptors.dart';
import 'dio/github/response_interceptor.dart';
import 'dio/github/test.dart';
import 'login/home.dart';
import 'login/login.dart';
import 'navigation/shared_preferences.dart';
import 'provider/demo_provider.dart';
const BASE_URL = 'https://apioffice.sunshinegroup.vn';
const BASE_URL_AUTH = 'https://api.sunshinegroup.vn:5000';

void main() async {
  SharedPreferences.getInstance().then((prefs){
    runApp(Login());
  });

}

class MyApp extends StatelessWidget {
  Dio dio;
  Dio dioAuth;
  final SharedPreferences prefs;
  void _configAuthApiService() async{
    dioAuth = Dio(BaseOptions(baseUrl: BASE_URL_AUTH));
    (dioAuth.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client){
      client.badCertificateCallback = (X509Certificate cert , String host , int port ) => true;
      return client;
    };
    dioAuth.interceptors.add(InterceptorsWrapper(
      onRequest: (requestOptions){
        requestOptions.headers['Authorization'] =
        'Basic bW9iaWxlX3N1bnNoaW5lX2luc2lkZV9wcm9kOnZ0Yzg0UkdDRWpKbnlUZVpUY0FEa1RKS3c=';
      }
    ));
    dioAuth.interceptors.add(InterceptorsWrapper(
      onRequest: (requestOption){
        developer.log(requestOption.path);
        if(requestOption.data != null){
          developer.log('${requestOption.data}');
        }
      },
      onResponse: (response){
        developer.log('${response.data}');
        print('${response.data}');
      }
    ));
    dioAuth.interceptors.add(LogInterceptor());
  }
  MyApp({this.prefs}){
    _configAuthApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


