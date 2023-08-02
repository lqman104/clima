import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String _apiKey = dotenv.env['API_KEY'].toString();
  static const _baseUrl = "api.openweathermap.org";
  static const _version = "/data/2.5/";
  static const _appIdPath = "appid";

  late Uri _uri;
  final String path;
  final Map<String, dynamic>? query;

  NetworkHelper({required this.path, this.query}) {
    if(query?[_appIdPath] == null) {
      query?[_appIdPath] = _apiKey;
    }

    _uri = Uri.https(_baseUrl, _version + path, query);
  }

  Future getData() async {
    http.Response response = await http.get(_uri);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        return convert.jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
