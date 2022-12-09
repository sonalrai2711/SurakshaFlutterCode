import 'package:flutter/material.dart';
import 'package:surakshaproj/DatabaseHandler/dbHelper.dart';
import 'package:surakshaproj/Screen/help.dart';
import 'package:surakshaproj/Screen/location1.dart';
import 'package:surakshaproj/Screen/login.dart';
import 'package:surakshaproj/Screen/notification.dart';
import 'package:surakshaproj/Screen/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NavBarScreen extends StatefulWidget {
  NavBarScreen({Key? key}) : super (key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreen();
}

//class NavBar extends StatelessWidget{
class _NavBarScreen extends State<NavBarScreen> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String userName = "";
  String email ="";

  @override
  void initState(){
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async{
    final SharedPreferences sp = await _pref;
    setState(() {
      userName = sp.getString("user_name")!;
      email = sp.getString("email")!;
    });
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('$userName'),
            accountEmail: Text('$email'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/Sonal.jpg',
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: (){Navigator.pushReplacement(context,
    MaterialPageRoute(builder:
    (context) => NotifScreen()));

    },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Divider(),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location'),
            onTap: (){Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => DashboardScreen()));
              },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share Your Location'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: (){Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => HelpScreen()));
              },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Update Your Profile'),
            onTap: (){Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => ProfileScreen()));
              },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => LoginScreen()));
            } ,
          )

        ],
      ),
    );

  }

}