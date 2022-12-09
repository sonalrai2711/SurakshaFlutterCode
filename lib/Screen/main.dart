import 'dart:async';
import 'package:flutter/material.dart';
import 'package:surakshaproj/Screen/home.dart';
import 'package:surakshaproj/Screen/login.dart';
import 'package:surakshaproj/Screen/splash.dart';

//import 'package:surakshaapp/home.dart';
//import 'package:surakshaapp/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suraksha',
      /*Routes to Splashscreen(). LoginScreen(), HomeScreen() depending
      on user information*/
      routes: {
        '/' : (context) => Splash(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      //debugShowCheckedModeBanner: false,
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.cyan])),
        child:Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'Suraksha',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
        )
    ));
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.green, Colors.cyan])),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body: const MyStatefulWidget(),
      ));

  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Suraksha',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )),

            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.10,
                  right: 250,
                  left:250),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number, User Name or Email',

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.05,
                right: 250,
                left:250),
              child: Column(
                children: [
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  //labelText: 'Password',
                ),
              )],
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
            Container(
                height: 50,
                padding:  EdgeInsets.fromLTRB(250,10,250,10
                ),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}*/