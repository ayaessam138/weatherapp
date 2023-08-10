import 'package:flutter/material.dart';
import 'package:weatherpredict/models/weather.dart';

class weatherprovider extends ChangeNotifier {
  String? cityname;
  weathermodel? _weatherdata;
  set weatherdata(weathermodel? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  weathermodel? get weatherdata => _weatherdata;
}
