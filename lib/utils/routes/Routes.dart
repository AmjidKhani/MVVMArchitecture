import 'package:flutter/material.dart';
import '../../view/Signup.dart';
import '../../view/homescreen.dart';
import '../../view/login_screen.dart';
import '../../view/splashview.dart';
import 'RoutesName.dart';

 class Routes{
  
  static Route<dynamic> generatingroutes(RouteSettings settings){
    switch(settings.name)
    {
      case RoutesName.spashscreen:
        return  MaterialPageRoute(builder: (context)=>const spashscreen());
      case RoutesName.home:
        return  MaterialPageRoute(builder: (context)=>const home());
      case RoutesName.login:
        return  MaterialPageRoute(builder: (context)=>const login());
      case RoutesName.Signup:
        return  MaterialPageRoute(builder: (context)=> const SignUPView());

      default:
        return MaterialPageRoute(builder: (context)=>const Scaffold(
          body: Center(
            child: Text(
              "No More Pages"
            ),
          ),
        ));
    }


    
    

    
  }
  
}