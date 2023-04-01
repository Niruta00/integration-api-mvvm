import 'dart:convert';

import 'package:http/http.dart';
import 'package:reqres_api_integration/data/network/BaseApiServices.dart';
import 'package:reqres_api_integration/data/network/NetworkApiServices.dart';
import 'package:reqres_api_integration/res/app_url.dart';

class UserRepository {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> getApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getApiResponse(AppUrl.getUserUrl);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
