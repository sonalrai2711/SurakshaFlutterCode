import 'package:flutter/material.dart';
import 'package:surakshaproj/Screen/home.dart';
import 'package:surakshaproj/Screen/navDart.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super (key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}
class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('My Profile'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed:() =>
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => NavBarScreen()))
            },
          )
      ),
      body: SafeArea(
        child: Center(
          child:  Column(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(top:30.0, bottom: 5),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/Sonal.jpg'),
                  ),
                ),
                Text('Change Photo', textAlign: TextAlign.center,),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:30, bottom:5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name'
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:5, bottom:5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email'
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:5, bottom:5 ),
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number')
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:5, bottom:5 ),
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Birth Year')
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:5, bottom:5 ),
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Select Gender')
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:5, bottom:5 ),
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Emergency Contact 1')
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top:5, bottom:5 ),
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Emeregncy Contact 2')
                  ),
                ),
                Container(
                  height: 50,
                  width: 780,
                  padding:  EdgeInsets.only(left: 30.0,right: 30.0,top:10),
                  child: ElevatedButton(
                    child: Text ('Save'),

                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,

                    ),
                    onPressed: (){Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                  (context) => HomeScreen()));

                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      );


  }

}