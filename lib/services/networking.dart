import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class NetworkHelper {
  static const _apiKey = "827a5ee1239859b4e38d41b142c58568";
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
