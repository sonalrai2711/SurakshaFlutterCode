import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surakshaproj/DatabaseHandler/dbHelper.dart';
import 'directions_model.dart';
import 'package:geolocator/geolocator.dart';

class DirectionRepo extends StatefulWidget {
  //const DashboardScreen({Key? key}) : super(key: key);
  @override
  DirectionRepoState createState() => DirectionRepoState();
}

class DirectionRepoState extends State<DirectionRepo> {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  late final Dio _dio;
  late List<Placemark> placemarkOrigin;
  late List<Placemark> placemarkDest;
  String category = "";
  var dbHelper = DbHelper();
  late Marker currentMarker;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.592140, 77.046051),
    zoom: 14.4746,
  );
  late String _startAddress;

  DirectionRepoState({Dio? dio}) : _dio = dio ?? Dio();

  //get dbHelper => null;

  Future<String?> getLocationFromLatLong({
    required LatLng origin,
    required LatLng destination,
  }) async {
    placemarkOrigin =
        await placemarkFromCoordinates(origin.latitude, origin.longitude);
    Placemark place = placemarkOrigin[0];
    _startAddress =
    "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
  if (_startAddress.length >0){
    print(_startAddress);
    return _startAddress;
  }
  return null;
  }

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': 'AIzaSyApfxhoDfkVBR7qvP15WCPAn6-kO0xSPGE',
    });
    if (response.statusCode == 200) {
      //getLocationFromLatLong(origin: origin, destination: destination);
      return Directions.fromMap(response.data);
    }
    //getLocationFromLatLong;
    return null;
  }

  categoryData(String area) async {
    //print("Fetching category data for $area");
    //String areaName = '$area';
    final SharedPreferences sp = await _pref;
    print("Area: " + area);
    await dbHelper.getCategory("Dwarka").then((result) {
      sp.setString("category", result!.category);
    });

    category = sp.getString("category")!;
    print("Category:" + category);
    _getMarker();
  }

  _getMarker() async {
    if ('$category' == 'Green') {
      currentMarker = Marker(
          markerId: MarkerId("1"),
          position: _kGooglePlex.target,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    } else if ('$category' == 'Yellow') {
      currentMarker = Marker(
          markerId: MarkerId("1"),
          position: _kGooglePlex.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueYellow));
    } else {
      currentMarker = Marker(
          markerId: MarkerId("1"),
          position: _kGooglePlex.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
