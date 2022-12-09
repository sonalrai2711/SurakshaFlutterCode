import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surakshaproj/DatabaseHandler/dbHelper.dart';
import 'package:surakshaproj/Screen/navDart.dart';
import 'package:surakshaproj/Screen/notification.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Common/comHelper.dart';
import '../Model/directionsRepo.dart';
import 'login.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super (key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String userName = "";
  String phone = "";
  String area = "";
  String category ="";
  String emergencyContact = "";

  var dbHelper;
  late GoogleMapController mapController;
  late GoogleMapController _googleMapController;

  late LatLng _center ;//= LatLng(28.592140, 77.046051);

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.592140, 77.046051),
    zoom: 14.4746,
  );

  MapType mapTye = MapType.normal;
  Set<Marker> markerList=Set();
  late Marker currentMarker;

  @override
  void initState(){
    super.initState();
    _center = LatLng(28.592140, 77.046051);
    currentMarker = Marker(markerId: MarkerId("1"),
        position: _kGooglePlex.target,
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen));
    markerList.clear();
    markerList.add(currentMarker);
    getUserData();
    dbHelper=DbHelper();
    categoryData();
    //_getMarker();

  }
  Future<void> getUserData() async{
    final SharedPreferences sp = await _pref;

    setState(() {
      userName = sp.getString("user_name")!;
      phone = sp.getString("phone")!;
      area = sp.getString("area")!;
      emergencyContact = sp.getString("emergency_contact1")!;

    });
  }
  Future<void> categoryData() async {
    //print("Fetching category data for $area");
    //String areaName = '$area';
    final SharedPreferences sp = await _pref;
    List<Location> placemark = (await locationFromAddress('$area'));
    await dbHelper.getCategory('$area').then((result){
      sp.setString("category", result.category);
    });
    setState(() {
      category = sp.getString("category")!;
      _getMarker();
      _center = LatLng(placemark[0].latitude, placemark[0].longitude);
      print(_center);
      _kGooglePlex = CameraPosition(
        target: LatLng(placemark[0].latitude, placemark[0].longitude),
        zoom: 14.4746,
      );
      print(_kGooglePlex.target);
    });
  }

  /*Future<void> _onMapCreated(GoogleMapController controller) async {
    List<Location> placemark = (await locationFromAddress('$area'));
    //_center = LatLng(placemark[0].latitude, placemark[0].longitude);
    setState(() {
      mapController = controller;
      _center = LatLng(placemark[0].latitude, placemark[0].longitude);

    });
  }*/

  _getMarker() async {
    if ('$category' == 'Green') {
      currentMarker = Marker(markerId: MarkerId("1"),
          position: _kGooglePlex.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen));
    }else if('$category' == 'Yellow'){
      currentMarker = Marker(markerId: MarkerId("1"),
          position: _kGooglePlex.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueYellow));
    }else{
      currentMarker = Marker(markerId: MarkerId("1"),
          position: _kGooglePlex.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed));
    }
  }
  _makingPhoneCall() async {
    //var url = Uri.parse("tel:+91$phone");
    final number = '+91$emergencyContact';
    await FlutterPhoneDirectCaller.callNumber(number);
    /*if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }*/

  }

  _sendText() async {
    //var url = Uri.parse("https://wa.me/$emergencyContact?text=HelloWorld");
    //await FlutterPhoneDirectCaller.callNumber(number);
    var url = Uri.parse("sms:$emergencyContact");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

        child: Column(

          children: [
            Container(
        padding: EdgeInsets.only(top: 40.0, left: 5),
              child: Row(
                children: <Widget>[
                  IconButton(
                  icon: Icon(Icons.menu, color: Colors.green, size: 30,),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) => NavBarScreen()));},
                  ),
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.asset('assets/Sonal.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('$userName', style: TextStyle(fontSize:10.0),),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2,color: Colors.grey,),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:10.0, top:10),
                    child: Text("Your current location: $area",
                      style: TextStyle(fontWeight: FontWeight.bold,

                      ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:10.0, top:10.0),
                    child: Text("Safety Index is $category"),
                  ),
                ],
            ),
            ),
            Container(
              child: SizedBox(height: 500,
              child:Padding(
                padding: EdgeInsets.all(20),
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    //onMapCreated: _onMapCreated,
                    onMapCreated: (controller) =>
                    _googleMapController = controller,
                    initialCameraPosition: _kGooglePlex,
                    markers: markerList,
                    onCameraIdle: (){
                      setState(() {
                        markerList.clear();
                        markerList.add(currentMarker);
                      });
                    },
                    /*onCameraMove: (campposition){
                      currentMarker=Marker(
                          markerId: MarkerId("1"),
                          position: campposition.target,
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
                    },*/
              )),
            )

            ),
            Divider(thickness: 2,color: Colors.grey,),
            Padding(
              padding: EdgeInsets.only(left:10.0, top:10),
              child: Text("Take safer decisions"),
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: _makingPhoneCall,
                            child: Image.asset('assets/sos.jpg',
                              height: 100,width: 100,
                            fit: BoxFit.cover, ),

                      ),
                      ),
                      Text("SOS"),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: (){
                            _sendText();
                          },
                        child: Image.asset('assets/notification.jpg',
                          height: 100,width: 100,
                        fit: BoxFit.cover,),
                      )
                      ),
                      Text("Send SMS"),
                    ],
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: _goToTheLake,
                        child: Image.asset('assets/location.jpg',
                          height: 100,width: 100,
                        fit: BoxFit.cover,),
                      )
                      ),
                      Text("Share location"),
                    ],
                  )
                ],
              ),
            ),
          ])),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _center != null
              ? CameraPosition(target: target):
          CameraPosition(target: _center),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),*/
    );

}

  Future<void> _goToTheLake() async{
    if(currentMarker == null){
      return;
    }
    Share.share('https://www.google.com/maps/search/?'
        'api=1&'
        'query='
        '${currentMarker.position.latitude},'
        '${currentMarker.position.longitude}');
  }
}