import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherpredict/models/weather.dart';
import 'package:weatherpredict/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weather) : super(WeatherInitial());
  String? cityname;
  weatherservice? weather;
  weathermodel? weatherdata;
  void getweather({required String cityname}) async {
    emit(Weatherlodaing());

    try {
      weathermodel? weatherdata = await weather?.getweather(cityname: cityname);
      emit(Weathersucess(weathersucessdata: weatherdata!));
    } on Exception catch (e) {
      emit(Weatherfail());
    }
  }
}
