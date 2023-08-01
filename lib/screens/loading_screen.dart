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

      Map<String, dynamic> query = {
        "lat": location.latitude.toString(),
        "lon": location.longitude.toString(),
        "units": "metric",
      };

      NetworkHelper networkHelper = NetworkHelper(path: "weather", query: query);
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
