import '../data/network/BaseApiservices.dart';
import '../data/network/NetworkApiservices.dart';
import '../res/app_url.dart';

class AuthRepository
{
  BaseApiServices _apiServices=NetworkApiServices();

Future<dynamic> loginApi(dynamic data)async{
 try{
   dynamic response=await _apiServices.getPostApiResponse(

       Appurls.loginendpoint, data);

   return response;
 }catch(e){

   throw e;
 }
}
  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(
          Appurls.Signupendpoint, data);
      return response;
    }catch(e){

      throw e;
    }
  }
}