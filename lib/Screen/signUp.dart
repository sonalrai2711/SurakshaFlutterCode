
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:location/location.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:surakshaproj/Common/comHelper.dart';
import 'package:surakshaproj/DatabaseHandler/dbHelper.dart';
import 'package:surakshaproj/DatabaseHandler/dbHelperSafetyIndex.dart';
import 'package:surakshaproj/Model/SafetyIndexModel.dart';
import 'package:surakshaproj/Model/UserModel.dart';
import 'package:surakshaproj/Screen/login.dart';
import 'package:toast/toast.dart';

//import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super (key: key);


  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen>{
  final _formKey = new GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final emergencyContController1 = TextEditingController();
  final emergencyContController2 = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  var dbHelper ;
  var safeHelper;


  late String valueChoosen;
  late String valueChoosen1;
  List genderList=[
   'Select Gender', 'Male', 'Female', 'Non-binary', 'Transgender', 'Intersex','Choose Not to respond',
  ];

  List areaList=[
    'Select Area','AIIMS','Adarsh Nagar', 'Adchini', 'Ajmeri Gate','Akbar Road',
    'Alaknanda',
    'Alipur',
    'Anand Parbat',
    'Anand Vihar',
    'Andrews Ganj',
    'Ashok Nagar',
    'Ashok Vihar',
    'Aya Nagar',
    'Ayurvigyan Nagar',
    'Azadpur',
    'BK Dutt Colony',
    'Badarpur',
    'Bahadur Shah Zafar Marg',
    'Barakhamba',
    'Barwala',
    'Bawana',
    'Begumpur',
    'Ber Sarai',
    'Bhalswa',
    'Bijwasan',
    'Budh Vihar',
    'Central Secretariat',
    'Chanakyapuri',
    'Chandni Chowk',
    'Chawri Bazaar',
    'Chhatarpur',
    'Chirag Dilli',
    'Chittaranjan Park',
    'Civil Lines',

  ];

  @override
  void initState(){
    super.initState();
    valueChoosen="Select Gender";
    valueChoosen1="Select Area";
    dbHelper=DbHelper();
    safeHelper = DbHelperSafetyIndex();

  }

   signUp() async{
    String uname = nameController.text;
    String uemail = emailController.text;
    String uphone = phoneController.text;
    String uecontact1 = emergencyContController1.text ;
    String uecontact2 = emergencyContController2.text ;
    String upassword = passwordController.text;
    String uconfPass = confirmPasswordController.text;

    if(_formKey.currentState!.validate()){
      if(upassword!=uconfPass){
        alertDialog(context, "Password Mismatch");
      } else{
        _formKey.currentState?.save();
        UserModel uModel = UserModel(uname, uemail, uphone, valueChoosen,valueChoosen1,
          uecontact1, uecontact2, upassword);
        dbHelper.saveData(uModel).then((userData) async {
        alertDialog(context,"Successfully Saved");
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', ModalRoute.withName('/login'));
        }).catchError((error){
          print(error);
          alertDialog(context, "Error: Data Save Failed");
          //return false;
    });
        /*SafetyIndexModel sModel = SafetyIndexModel('Barakhamba','0.0384685839897417','Green'
);*/
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,),
      body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top:50),
                  child: Text('Create New Account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already have one? '),
                      Container(
                        //padding: EdgeInsets.all(1.0),
                        child:  TextButton(
                            child:Text(' Log in ',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder:
                                      (context) => LoginScreen()));
                            }
                        ),
                      ),
                      Text('here')
                    ]
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: nameController,
                    obscureText: false,
                    //keyboardType: ,
                    validator: (val) => val?.length ==0 ? 'Please Enter Username': null,
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person)),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: emailController,
                    obscureText: false,
                    //keyboardType: ,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please Enter Email';
                      }
                      if(!validateEmail(value)){
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: phoneController,
                    obscureText: false,
                    //keyboardType: ,
                    validator: (val) => val?.length ==0 ? 'Please Enter Phone Number': null,
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone)),
                  ),
                ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.only(top:10),
                    child: DropdownButton(
                      hint: Text('Select Gender'),
                      isExpanded: true,
                      onChanged: (newValue){
                        setState(() {
                          valueChoosen = newValue.toString();
                        });
                      },
                      value: valueChoosen,


                      items: genderList.map((valueItem){
                        return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem));
                      },
                    ).toList(),
                  ),
        ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.only(top:10),
                  child: DropdownButton(
                    hint: Text('Select Area'),
                    isExpanded: true,
                    //value: valueChoosen,
                    onChanged: (newValue){
                      setState(() {
                        valueChoosen1 = newValue.toString();
                      });
                    },
                    value: valueChoosen1,
                    items: areaList.map((valueItem){
                      return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem));
                    },
                    ).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: emergencyContController1,
                    obscureText: false,
                    //keyboardType: ,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please Enter some Emergency Contact 1';
                      }
                      return null;
                    },
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(
                        hintText: 'Emergency Contact 1',
                        labelText: 'Emergency Contact 1',
                        prefixIcon: Icon(Icons.phone)),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: emergencyContController2,
                    obscureText: false,
                    //keyboardType: ,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please Enter some Emergency Contact 2';
                      }
                      return null;
                    },
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(
                        hintText: 'Emergency Contact 2',
                        labelText: 'Emergency Contact 2',
                        prefixIcon: Icon(Icons.phone)),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top:10),

                  child:
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    //keyboardType: ,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(

                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.visibility_off)),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    //keyboardType: ,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please Enter Confirm Password';
                      }
                      return null;
                      },
                    //onSaved: (val) => nameController.text = val!,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.visibility_off)),
                  ),

                ),
                Container(
                  height: 50,
                  width: 780,margin: EdgeInsets.only(top:30),

                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    child: Text ('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ), onPressed:  signUp,
                  )
                  ),

            ],
    ),
    ),
      ),
      )
    ));
  }
}