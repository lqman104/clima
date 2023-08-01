import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class NetworkHelper {

  static const _apiKey = "827a5ee1239859b4e38d41b142c58568";
  final Uri uri;

  NetworkHelper({required this.uri}) {
    uri.queryParameters['appid'] = _apiKey;
  }

  Future getData() async {
    http.Response response = await http.get(uri);

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