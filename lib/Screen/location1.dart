import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surakshaproj/DatabaseHandler/dbHelper.dart';
import 'package:surakshaproj/Screen/home.dart';
import '../Model/directions_model.dart';
import '../Model/directionsRepo.dart';
import '../Screen/navDart.dart';
import 'package:http/http.dart' as http;


class DashboardScreen extends StatefulWidget {
  //const DashboardScreen({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  var _initialCameraPosition = CameraPosition(
    target: LatLng(28.592140, 77.046051),
    zoom: 11.5,
  );
  TextEditingController startAddressController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();

  late GoogleMapController _googleMapController;
  Set<Marker> markerList = Set();
  late Marker currentMarker;
  late Marker _origin;
  late Marker _destination;
  late Directions _info;
  var _currentPosition;
  var _currentAddress;
  var _startAddress;
  String area = "";
  String category = "";
  late var sourceSafetyIndex;
  late var destSafetyIndex;

  //late Location sourcePlacemark;
  late LatLng sourcep;
  late LatLng dp;
  var dbHelper;

  void initState() {
    super.initState();
    dbHelper = DbHelper();
    _origin = Marker(markerId: MarkerId("111"));
    _destination = Marker(markerId: MarkerId("111"));
    _info = null as Directions;
    //sourcePlacemark=Location(latitude: 28.592140, longitude: 77.046051, timestamp: DateTime.now());
    getUserData();
    sourceSafetyIndex = 'default';
    destSafetyIndex = 'default';
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    setState(() {
      area = sp.getString("area")!;
      print("area");
      print(area);
      startAddressController.text = area;
      _addMarker(startAddressController.text);
    });
  }

  void categoryData(String area) async {
    //print("Fetching category data for $area");
    //String areaName = '$area';

    print("area" + area);
    String cat;
    category = "";
    final SharedPreferences sp = await _pref;
    await dbHelper.getCategory(area).then((result) {
      sp.setString("category", result.category);
    });

    print("String category: ");
    print(sp.getString("category"));
    setState(() {
      category = sp.getString("category")!;
      if (category == "") {
        category = "Blank";
      }
    });
  }

  void _setMarker(
      String text, double latitude, double longitude, String markerType) async {
    Marker markerVal;
    print("we are in set ");
    print(text);
    print('$category');
    if ('$category' == 'Green') {
      markerVal = Marker(
          markerId: MarkerId(markerType),
          position: LatLng(latitude, longitude),
          infoWindow: const InfoWindow(
              title: ''),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    } else if ('$category' == 'Yellow') {
      markerVal = Marker(
          markerId: MarkerId(markerType),
          position: LatLng(latitude, longitude),
          infoWindow: const InfoWindow(
              title: ''),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueYellow));
    } else if ('$category' == 'Red') {
      markerVal = Marker(
          markerId: MarkerId(markerType),
          position: LatLng(latitude, longitude),
          infoWindow: const InfoWindow(
              title: ''),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    } else {
      markerVal = Marker(
          markerId: MarkerId(markerType),
          position: LatLng(latitude, longitude),
          infoWindow: const InfoWindow(
              title: 'Safety Index not yet Determined. Stay Safe'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange));
    }
    if (markerType == 'origin') {
      setState(() {
        _origin = markerVal;
        sourceSafetyIndex = '$category';
        print("sourceSafetyIndex" + sourceSafetyIndex);
      });
    } else if (markerType == 'destination') {
      setState(() {
        _destination = markerVal;
        destSafetyIndex = '$category';
      });
    }
  }

  _addMarker(String text) async {
    //get source location coordinates
    categoryData(text);

    List<Location> placemark = (await locationFromAddress(text));

    //Camera Position for the source
    _initialCameraPosition = CameraPosition(
      target: LatLng(placemark[0].latitude, placemark[0].longitude),
      zoom: 14.4746,
    );
    print("Origin");
    print(_origin);
    if ((_origin == _destination)) {
      print("Setting origin value");
      print(placemark[0].longitude);
      _setMarker(text, placemark[0].latitude, placemark[0].longitude, 'origin');
    } else {
      print("Setting destination value");
      print(placemark[0].longitude);
      _setMarker(
          text, placemark[0].latitude, placemark[0].longitude, 'destination');

      List<Location> sourcePlace =
          (await locationFromAddress(startAddressController.text));

      List<Location> targetPlace =
          (await locationFromAddress(destinationAddressController.text));

      //Get Directions
      final directions = await DirectionRepoState().getDirections(
          origin: LatLng(sourcePlace[0].latitude, sourcePlace[0].longitude),
          destination:
              LatLng(targetPlace[0].latitude, targetPlace[0].longitude));

      setState(() => _info = directions!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('Get the Directions'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: startAddressController,
                  obscureText: false,
                  //keyboardType: ,
                  //validator: (val) => val?.length ==0 ? 'Please Enter Username': null,
                  //onSaved: (val) => nameController.text = val!,
                  decoration: InputDecoration(
                    hintText: 'Your Location',
                    labelText: 'Your Location',
                    border: OutlineInputBorder(),
                    //prefixIcon: Icon(Icons.person)),
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: destinationAddressController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Destination',
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                    //prefixIcon: Icon(Icons.person)),
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height: 50,
                  child:
                    Text("Travel safe \nfrom " + startAddressController.text
                 + " " + sourceSafetyIndex
                    + " zone \nto " + destinationAddressController.text
                 + " " + destSafetyIndex + " zone." ),
            ),
            ),

            Container(
                child: SizedBox(
              height: 300,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (controller) =>
                        _googleMapController = controller,
                    /*markers: markerList,
                      onCameraIdle: (){
                        setState(() {
                          markerList.clear();
                          markerList.add(currentMarker);
                        });
                      },*/
                    //markers: _addMarker(),
                    markers: {
                      if (_origin != null) _origin,
                      if (_destination != null) _destination
                    },
                    polylines: {
                      if (_info != null)
                        Polyline(
                          polylineId: const PolylineId('overview_polyline'),
                          color: Colors.red,
                          width: 5,
                          points: _info.polylinePoints
                              .map((e) => LatLng(e.latitude, e.longitude))
                              .toList(),
                        ),
                    },
                    //onLongPress: _addMarker,
                  )),
            )),
            Container(
                height: 50,
                width: 780,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  child: Text('Directions'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    _addMarker(destinationAddressController.text);
                  },
                )),
            if (_info != null)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
