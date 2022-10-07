import 'package:flutter/material.dart';
import 'package:mvvmarchi/utils/routes/Routes.dart';
import 'package:mvvmarchi/utils/routes/RoutesName.dart';
import 'package:mvvmarchi/view/homescreen.dart';
import 'package:mvvmarchi/view/login_screen.dart';
import 'package:mvvmarchi/viewmodel/auth_view_model.dart';
import 'package:mvvmarchi/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        child: MaterialApp(
      initialRoute: RoutesName.spashscreen,
          onGenerateRoute: Routes.generatingroutes,
    ),
        providers:[
          ChangeNotifierProvider(create:(context)=>AuthModel()),
          ChangeNotifierProvider(create:(context)=>User_View_Model())

        ] );
  }
}
