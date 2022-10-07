import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mvvmarchi/data/app_exceptions.dart';
import 'package:mvvmarchi/data/network/BaseApiservices.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getApiResponse(String uri) async{
    dynamic jsonresponse;
 try{

final response=await http.get(Uri.parse(uri)).timeout(const Duration(seconds: 20));
jsonresponse=responseresult(response);

 }on SocketException{
   throw FetchDataException('No Internet connection');
 }
 return jsonresponse;
  }
  @override
  Future getPostApiResponse(String uri,dynamic data) async{
    dynamic jsonresponse;
    try{
      final response=await http.post(Uri.parse(uri),
        body: data,);
    jsonresponse=responseresult(response);

  }on SocketException{
  throw FetchDataException('No Internet connection');
}
return jsonresponse;
  }


   dynamic responseresult(http.Response response){

   switch(response.statusCode){
     case 200:
       print(response.statusCode.toString());
     dynamic jsonresponse=jsonDecode(response.body);

        return jsonresponse;
     case 400:
       throw FetchDataException(response.body.toString());

     case 500:
       throw    BadRequestException(response.body.toString());


     case 600:
       throw  UnauthorizedException(response.body.toString());

     default:
       throw  FetchDataException("satauss code not found"+response.statusCode.toString());
   }


   }

}