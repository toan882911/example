import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'module/user_reponse.dart';

class UserApiProvider{
  final String _endpoint = "https://randomuser.me/";
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://randomuser.me/",
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )
  );

  UserApiProvider() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) async {
        print('UserApiProvider - ${options.baseUrl}');
        options.headers["verifyToken"] = "Bearer";
        if (options.headers.containsKey("requiresToken")) {
//          options.headers.remove("requiresToken");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var header = prefs.get("Header");
          options.headers.addAll({"Header": "$header${DateTime.now()}"});
        }

      },
      onResponse: (options) async {
        if(options.headers.value("verifyToken") != null){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var verifyToken = prefs.get("VerifyToken");
          if(options.headers.value("VerifyToken") == verifyToken){
            print('continue with the request');
          }
        }
      },
      onError: (err) async{
        if(err.message.contains("ERROR_001")){
          print("error : ERROR_001");
        }
      }
    ));
    _dio.interceptors.add(LogInterceptor());
  }
  Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get("/api",options: Options(headers: {"requiresToken" : true}));
      print(response.data);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }
}