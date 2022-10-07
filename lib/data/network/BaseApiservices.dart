abstract class BaseApiServices{

  Future<dynamic> getApiResponse(String uri);
  Future<dynamic> getPostApiResponse(String uri,dynamic data);


}