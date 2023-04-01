abstract class BaseApiService {
  Future<dynamic> getApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url,dynamic data);
}
