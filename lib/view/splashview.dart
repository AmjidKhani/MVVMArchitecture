import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../viewmodel/services/splashservices.dart';

class spashscreen extends StatefulWidget {
  const spashscreen({Key? key}) : super(key: key);

  @override
  State<spashscreen> createState() => _spashscreenState();
}

class _spashscreenState extends State<spashscreen> {
  splashservice splashv=splashservice();
  @override
  void initState() {
    splashv.checkuser(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Splash Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
        ],
      ),
    );
  }
}
