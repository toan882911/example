import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestDio extends StatefulWidget {
  @override
  _TestDioState createState() => _TestDioState();
}

class _TestDioState extends State<TestDio> {
  main() async {
    var dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.options.baseUrl = "http://httpbin.org";
    try {
      await Future.wait([
        dio.get("/get", queryParameters: {"id": 1}),
//        dio.get("/get", queryParameters: {"id": 2})
      ]);
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    main();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}