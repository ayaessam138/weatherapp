part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class Weatherlodaing extends WeatherState {}

class Weatherfail extends WeatherState {}

class Weathersucess extends WeatherState {
  weathermodel ?weathersucessdata;
  Weathersucess({required this.weathersucessdata});
}
