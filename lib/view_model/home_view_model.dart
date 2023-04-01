import 'package:flutter/cupertino.dart';
import 'package:reqres_api_integration/data/response/api_response.dart';
import 'package:reqres_api_integration/model/user_model.dart';
import 'package:reqres_api_integration/respository/home_repository.dart';

class HomeViewModel with ChangeNotifier {

  final _myrepo = HomeRepository();
  ApiResponse<UserModel> userList = ApiResponse.loading();
  SetUserList(ApiResponse<UserModel> response) {
    userList = response;
    // notifyListeners();
  }

  Future<void> requestApi() async {
    SetUserList(ApiResponse.loading());
    _myrepo.requestApi().then((value) {
       SetUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      SetUserList(ApiResponse.error(error.toString()));
    });
  }
}
