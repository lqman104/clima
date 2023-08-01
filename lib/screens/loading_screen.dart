import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getWeather() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();

      Map<String, dynamic> query = {
        "lat": location.latitude.toString(),
        "lon": location.longitude.toString(),
        "units": "metric",
      };

      NetworkHelper networkHelper = NetworkHelper(path: "weather", query: query);
      var json = await networkHelper.getData();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(weatherData: json);
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
