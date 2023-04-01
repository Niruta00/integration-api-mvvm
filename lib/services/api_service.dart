import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reqres_api_integration/model/user_model.dart';
// import 'package:nvnm/model/model.dart';

class ApiServices {
  Future<List<UserModel>> getData() async {
    List<UserModel> allUsers = [];
    String baseUrl = "https://reqres.in/api/";

    try {
      var response = await http.get(Uri.parse("${baseUrl}users?page=1 "));

      var jsonData = json.decode(response.body);

      for (int i = 0; i < jsonData['data'].length; i++) {
        UserModel users = UserModel.fromJson(jsonData['data'][i]);
        allUsers.add(users);
      }
    } catch (e) {}

    return allUsers;
  }
}