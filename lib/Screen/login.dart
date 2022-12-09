import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surakshaproj/Common/comHelper.dart';
import 'package:surakshaproj/Model/SafetyIndexModel.dart';
import 'package:surakshaproj/Model/UserModel.dart';
import 'package:toast/toast.dart';

import '../DatabaseHandler/dbHelper.dart';
import 'forgotPassword.dart';
import '../Screen/signUp.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super (key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}
class _LoginScreen extends State<LoginScreen>{
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();
  }

  login() async{
    String uname = nameController.text;
    String upassword = passwordController.text;

    if(uname.isEmpty){
      alertDialog(context, "Please Enter Username");
    }else if (upassword.isEmpty){
      alertDialog(context, "Please Enter Password");
    }else{
      await dbHelper.getLoginUser(uname, upassword).then((userData) {
        if(userData != null){
          setSP(userData).whenComplete((){
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                    (Route<dynamic>route)=>false);
          });
        } else{
          print("here 1");
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error){
        alertDialog(context, "Error Login fail");
      });
        }
      }

  Future setSP(UserModel user) async{
    final SharedPreferences sp = await _pref;
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("phone", user.phone);
    sp.setString("gender", user.gender);
    sp.setString("area", user.area);
    sp.setString("emergency_contact1", user.emergency_contact1);
    sp.setString("emergency_contact2", user.emergency_contact2);
    sp.setString("password", user.password);
  }

  Future setSPCat(SafetyIndexModel safIndex) async{
    final SharedPreferences spCat = await _pref;
    spCat.setString("area", safIndex.area);
    spCat.setString("safetyIndex", safIndex.safetyIndex);
    spCat.setString("category", safIndex.category);
  }

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
        body: SingleChildScrollView(
          child:Container(
        child: Center(
        child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image(
                          image: AssetImage('assets/logo.jpg'),
                        )

                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top:10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Username',
                            prefixIcon: Icon(Icons.person)),
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top:10),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.visibility_off)),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 250),
                      margin: EdgeInsets.only(top:10, bottom: 10),
                      child:
                      TextButton(
                          onPressed: (){Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) => forgotPassword()));

                          },

                          child: Text('Forgot Password?',
                            style: TextStyle(color: Colors.black),)
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 780,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        child: Text ('Log In'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: login,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 200.0),
                          child: const Text('Don\'t have an account'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:200.0),
                          child: TextButton(
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
                              ),
                              onPressed: (){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder:
                                        (context) => SignupScreen()));

                              }),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ],

                )
//        )
            )

    )
        )
    )
    ;
  }}