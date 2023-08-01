import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

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
      double lat = location.latitude;
      double long = location.longitude;

      Uri uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
        "lat": lat.toString(),
        "lon": long.toString(),
      });

      NetworkHelper networkHelper = NetworkHelper(uri: uri);
      var json = await networkHelper.getData();

      Map<String, dynamic> formattedResponse = {
        "temp": json["main"]["temp"],
        "city_name": json["name"],
        "condition": json["weather"][0]["id"]
      };

      print(formattedResponse);
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
    return Scaffold();
  }
}
