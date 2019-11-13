

import 'package:flutter_test_textfield/dio/module/user_reponse.dart';
import 'package:flutter_test_textfield/dio/user_api_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = new UserApiProvider();
  Future<UserResponse> getUser() {
    return _apiProvider.getUser();
  }
}