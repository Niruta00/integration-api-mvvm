import 'dart:convert';

import 'package:http/http.dart';
import 'package:reqres_api_integration/data/network/BaseApiServices.dart';
import 'package:reqres_api_integration/data/network/NetworkApiServices.dart';
import 'package:reqres_api_integration/res/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> requestApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.getUserUrl, data);
      return response;
      
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> registerApi(dynamic data) async {
  //   try {
  //     dynamic response =
  //         await _apiService.getPostApiResponse(AppUrl.requestUrl, data);
  //     return response;
  //     // Response response = await post(Uri.parse("asfds"), body: {
  //     //   'sdat':'asd'
  //     // })
  //     //     .timeout(Duration(seconds: 10));
  //     // var data = jsonDecode(response.body);
  //     // if (response.statusCode == 200) {
  //     //   return data;
  //     // } else if (response.statusCode == 400) {
  //     //   return data;
  //     // }
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
