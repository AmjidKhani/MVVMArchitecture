

import 'package:flutter/material.dart';
import 'package:mvvmarchi/utils/routes/Routes.dart';
import 'package:mvvmarchi/utils/routes/RoutesName.dart';

import '../../model/user_model.dart';
import '../../viewmodel/user_view_model.dart';

class splashservice{

  Future<user_model> getuser(){

   return User_View_Model().getuser();
  }
  void checkuser(BuildContext context){
    getuser().then((value)  {

      if (value.token=='null' || value.token=='') {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);

      }
      else{
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.  home);
      }

    });

  }


}