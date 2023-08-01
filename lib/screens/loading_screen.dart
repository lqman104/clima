import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../repository/weather_repository.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? error;

  void getWeather() async {
    try {
      var weatherData = await WeatherRepository.getWeather();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(weatherData: weatherData);
        }),
      );
    } catch (e) {
      error = e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (error == null) {
      widget = SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      );
    } else {
      widget = Text(error ?? "");
    }

    return Scaffold(
      body: Center(
        child: widget,
      ),
    );
  }
}
