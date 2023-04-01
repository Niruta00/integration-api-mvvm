import 'package:reqres_api_integration/data/network/BaseApiServices.dart';
import 'package:reqres_api_integration/data/network/NetworkApiServices.dart';
import 'package:reqres_api_integration/model/user_model.dart';
import 'package:reqres_api_integration/res/app_url.dart';

class HomeRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<UserModel> requestApi() async {
    try {
      dynamic response = await _apiService.getApiResponse(AppUrl.getUserUrl);
      return response = UserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
