import '../data/network/BaseApiservices.dart';
import '../data/network/NetworkApiservices.dart';
import '../model/Movie_Model.dart';
import '../res/app_url.dart';
class  HomeRepository{
  BaseApiServices _apiServices=NetworkApiServices();

  Future<movies_model> FetchData()async{
    try{
      dynamic response=await _apiServices.getApiResponse(Appurls.moviewbaseurl);

      return  response=movies_model.fromJson(response);
    }catch(e)
    {

      throw e;
    }
  }
}