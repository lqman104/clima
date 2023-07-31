import 'package:clima/screens/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      print("Long: ${location.longitude}");
      print("Lat: ${location.latitude}");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
