import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class User_View_Model with ChangeNotifier{
Future<bool> saveuser(user_model user)async{
  SharedPreferences sp=await SharedPreferences.getInstance();
  sp.setString('Token', user.token.toString());
  notifyListeners();
  return true;
}
Future<user_model> getuser()async{
  SharedPreferences sp=await SharedPreferences.getInstance();
  final String? token= sp.getString('Token');
  return user_model(
token: token.toString(),

  );

}
Future<bool> removeuser() async {
  SharedPreferences sp=await SharedPreferences.getInstance();
  sp.remove('Token');
 return true;
}




}