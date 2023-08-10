import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherpredict/models/weather.dart';

class weatherservice {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = 'c1c281dfdb8c40cf8d6193944230407';
  Future<weathermodel?> getweather({required String cityname}) async {
    weathermodel? weatherdata;
    try {
      Uri url = Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname');
      http.get(url);
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);

      weatherdata = weathermodel.fromjsion(data);
    }
    // ignore: empty_catches
    catch (e) {
      print(e);
    }
    return weatherdata;
  }
}
