import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmarchi/repository/auth_repository.dart';
import 'package:mvvmarchi/utils/routes/RoutesName.dart';
import 'package:mvvmarchi/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../utils/util.dart';

class AuthModel with ChangeNotifier{
  final _myrepo=AuthRepository();
  bool _loading=false;

   setLoading(bool load){
    _loading=load;
    notifyListeners();
  }
  bool get gettingloading{
    return _loading;
   }

  bool signuploading=false;

  setsignupLoading(bool load){
    signuploading=load;
    notifyListeners();
  }
  bool get gettingsignuploadingg{
    return signuploading;
  }



  Future<void> LoginApi(dynamic data,BuildContext context)async{
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      print(value.toString());
      final userpreference=Provider.of<User_View_Model>(context,listen: false);
      userpreference.saveuser(
          user_model(
            token: value['token'].toString()
            // token:
          )
      );
      Navigator.pushNamed(context,RoutesName.home);
      
    } ).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode) {
      //Utils.flushBarErrorMessage(error.toString(), context);
      }  } );
  }
  Future<void> SignupApi(dynamic data,BuildContext context)async{
    setsignupLoading(true);
    _myrepo.registerApi(data).then((value) {
      Navigator.pushNamed(context,RoutesName.home);

    } ).onError((error, stackTrace) {
      setsignupLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode) {
        //Utils.flushBarErrorMessage(error.toString(), context);
      }
    }
    );



  }
  }

