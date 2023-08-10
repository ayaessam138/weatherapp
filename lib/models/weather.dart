import 'package:flutter/material.dart';

class weathermodel {
  String date;
  double temp;
  double mintemp;
  double maxtemp;
  String weathersatatename;

  weathermodel(
      {required this.date,
      required this.temp,
      required this.mintemp,
      required this.maxtemp,
      required this.weathersatatename});
  factory weathermodel.fromjsion(dynamic data) {
    var jsiondata = data['forecast']['forecastday'][0]['day'];
    return weathermodel(
        date: data['location']['localtime'],
        temp: jsiondata['avgtemp_c'],
        mintemp: jsiondata['mintemp_c'],
        maxtemp: jsiondata['maxtemp_c'],
        weathersatatename: jsiondata['condition']['text']);
  }
  @override
  String toString() {
    return 'temp=$temp, ,mintemp=$mintemp, maxtemp=$maxtemp';
  }

  String getimage() {
    if (weathersatatename == 'Sunny' ||
        weathersatatename == 'Clear' ||
        weathersatatename == 'partly cloudy') {
      return 'asset/images/thunderstorm.png';
    } else if (weathersatatename == 'Blizzard' ||
        weathersatatename == 'Patchy snow possible' ||
        weathersatatename == 'Patchy sleet possible' ||
        weathersatatename == 'Patchy freezing drizzle possible' ||
        weathersatatename == 'Blowing snow') {
      return 'asset/images/cloudy.png';
    } else if (weathersatatename == 'Freezing fog' ||
        weathersatatename == 'Fog' ||
        weathersatatename == 'Heavy Cloud' ||
        weathersatatename == 'Mist' ||
        weathersatatename == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weathersatatename == 'Patchy rain possible' ||
        weathersatatename == 'Heavy Rain' ||
        weathersatatename == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weathersatatename == 'Thundery outbreaks possible' ||
        weathersatatename == 'Moderate or heavy snow with thunder' ||
        weathersatatename == 'Patchy light snow with thunder' ||
        weathersatatename == 'Moderate or heavy rain with thunder' ||
        weathersatatename == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'asset/images/cloudy.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weathersatatename == 'Sunny' ||
        weathersatatename == 'Clear' ||
        weathersatatename == 'partly cloudy') {
      return Colors.orange;
    } else if (weathersatatename == 'Blizzard' ||
        weathersatatename == 'Patchy snow possible' ||
        weathersatatename == 'Patchy sleet possible' ||
        weathersatatename == 'Patchy freezing drizzle possible' ||
        weathersatatename == 'Blowing snow') {
      return Colors.blue;
    } else if (weathersatatename == 'Freezing fog' ||
        weathersatatename == 'Fog' ||
        weathersatatename == 'Heavy Cloud' ||
        weathersatatename == 'Mist' ||
        weathersatatename == 'Fog') {
      return Colors.blueGrey;
    } else if (weathersatatename == 'Patchy rain possible' ||
        weathersatatename == 'Heavy Rain' ||
        weathersatatename == 'Showers	') {
      return Colors.blue;
    } else if (weathersatatename == 'Thundery outbreaks possible' ||
        weathersatatename == 'Moderate or heavy snow with thunder' ||
        weathersatatename == 'Patchy light snow with thunder' ||
        weathersatatename == 'Moderate or heavy rain with thunder' ||
        weathersatatename == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
