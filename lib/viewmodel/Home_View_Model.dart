import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarchi/data/response/api_response.dart';
import '../model/Movie_Model.dart';
import '../repository/home_reposatory.dart';

class HomeViewViewModel with ChangeNotifier{
  final _myrepo=HomeRepository();
  ApiResponse<movies_model>movirslist= ApiResponse.loading();
  setmovies(ApiResponse<movies_model> response){

    movirslist=response;
    notifyListeners();
  }
  Future<void> FetchDatalist()async{
     setmovies(ApiResponse.loading());
    _myrepo.FetchData().then(
            (value) {
setmovies(ApiResponse.complete(value));
    //  ApiResponse.complete(value);
    }
    ).onError((error, stackTrace) {
      ApiResponse.error(error.toString());
    }
    );
  }
}