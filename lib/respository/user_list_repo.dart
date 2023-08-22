import '../data/network/base_service.dart';
import '../data/network/network_service.dart';
import '../data/response/app_url.dart';
import '../model/user_list_model.dart';

class UserListRepo {
  BaseApiService _apiService = NetworkApiService();

  Future<UserListModel> userListApi() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(AppUrl.userList);
      return response = UserListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
