import 'package:flutter/material.dart';
import 'package:mvvm_provider/respository/user_list_repo.dart';

import '../data/response/app_response.dart';
import '../model/user_list_model.dart';

class HomeScreenProvider with ChangeNotifier {
  final _userlistrepo = UserListRepo();

  ApiResponse<UserListModel> userList = ApiResponse.loading();

  setUserList(ApiResponse<UserListModel> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> getUserListApi() async {
    setUserList(ApiResponse.loading());
    _userlistrepo.userListApi().then((value) {
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }
}
