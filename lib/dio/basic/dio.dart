import 'package:dio/dio.dart';
import 'posts.dart';

class DioApi{
  final String _endpoint = "https://my-json-server.typicode.com/typicode/demo/posts";
  final Dio _dio = Dio();
  String title;
  Future<Posts> getUser() async{
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data[0]);
      return Posts.fromJson(response.data);
    } catch (error ,stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return Posts.error("$error");
    }
  }
}
