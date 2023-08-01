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

}