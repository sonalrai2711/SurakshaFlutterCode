import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

//import 'login.dart';

class  Splash extends StatefulWidget {
  //const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  String _userName = "";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

    _loadUserInfo() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //_username = (prefs.getString('username') ?? "");
      //_userName = prefs.getString("user_name")!;
      //print("_username" + _userName);
      /*Timer creates a delay of 2 seconds and verifies if user information
      is persistent and navigates to either Login page or Home page
       */
      Timer(Duration(seconds: 2), ()
      {
        /*if (_userName != "" ) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/home', ModalRoute.withName('/home'));
        } else {*/
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', ModalRoute.withName('/login'));
        //}
      });


  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(
              image: AssetImage('assets/logo.jpg')
          )
      ),

    );
  }
}