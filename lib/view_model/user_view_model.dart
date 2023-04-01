import 'package:flutter/material.dart';
import 'package:reqres_api_integration/model/user_model.dart';
import 'package:reqres_api_integration/services/api_service.dart';
// import 'package:nvnm/model/model.dart';
// import 'package:nvnm/services/services.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> allUsers = [];
  List<UserModel> userToShow = [];

  Future<void> getApiData() async {
    allUsers = await ApiServices().getData();
    userToShow = allUsers;
    notifyListeners();
  }

  void filterUsers(String val) {
    if (val.length != 0) {
      userToShow = allUsers
          .where((element) =>
              element.data!.contains(val))
          .toList();
    } else {
      userToShow = allUsers;
    }
    notifyListeners();
  }
}