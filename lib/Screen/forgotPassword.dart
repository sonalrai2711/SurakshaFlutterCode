import 'package:flutter/material.dart';

import 'login.dart';


class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super (key: key);

  @override
  State<forgotPassword> createState() => _forgotPassword();
}
class _forgotPassword extends State<forgotPassword>{

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.green,),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30, 150, 30, 5),
                  child: Icon(Icons.lock_outlined, size: 100,),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(50, 30, 30, 30),
                  child: Text('Forgot your Password? Reset your password!!'),

                ),

                Container(
                  padding:  EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.visibility_off)),
                  ),
                ),
                Container(
                  padding:  EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.visibility_off)),
                  ),
                ),


                Container(
                  height: 50,
                  width: 780,
                  padding:  EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: ElevatedButton(
                    child: Text ('Change Password'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: (){Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) => LoginScreen()));
                      },
                  ),
                ),


]
            )
        )
    );




  }}