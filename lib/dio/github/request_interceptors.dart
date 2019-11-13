import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class RequestInterceptors extends StatefulWidget {
  @override
  _RequestInterceptorsState createState() => _RequestInterceptorsState();
}

class _RequestInterceptorsState extends State<RequestInterceptors> {
  main() async {
    Dio dio = Dio();
    dio.options.baseUrl = "http://httpbin.org/";
    dio.options.connectTimeout = 5000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print(options.connectTimeout);
      switch (options.path) {
        case "/fakepath1":
          return dio.resolve("fake data");
        case "/fakepath2":
          return dio.get("/get");
        case "/fakepath3":
        // You can also return a HttpError directly.
          return dio.reject("test error");
        case "/fakepath4":
        // Here is equivalent to call dio.reject("test error")
          return DioError(error: "test error");
        default:
          return options; //continue
      }
    }));
    Response response;
    response = await dio.get("/fakepath1");
    assert(response.data == "fake data");
    print(response.data);
    response = await dio.get("/fakepath2");
    assert(response.data["headers"] is Map);
    print(response.data);
    try {
      response = await dio.get("/fakepath3");
      print(response.data);
    } on DioError catch (e) {
      assert(e.message == "test error");
      assert(e.response == null);
    }
    try {
      response = await dio.get("/fakepath4");
      print(response.data);
    } on DioError catch (e) {
      print(e);
      assert(e.message == "test error");
      assert(e.response == null);
    }
    response = await dio.get("/get");
    assert(response.data["headers"] is Map);
    print(response.data);
    try {
      await dio.get("xsddddd");
    } on DioError catch (e) {
      assert(e.response.statusCode == 404);
    }
    dio.interceptors.add(LogInterceptor());
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