import '../services/location.dart';
import '../services/networking.dart';

class WeatherRepository {

  static Future<dynamic> getWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, dynamic> query = {
      "lat": location.latitude.toString(),
      "lon": location.longitude.toString(),
      "units": "metric",
    };

    NetworkHelper networkHelper = NetworkHelper(path: "weather", query: query);
    return await networkHelper.getData();
  }

  static Future<dynamic> getCityWeather(String cityName) async {
    Map<String, dynamic> query = {
      "q": cityName,
      "units": "metric",
    };

    NetworkHelper networkHelper = NetworkHelper(path: "weather", query: query);
    return await networkHelper.getData();
  }

}