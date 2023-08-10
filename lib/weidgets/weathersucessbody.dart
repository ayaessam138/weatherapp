import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherpredict/cubits/cubit/weather_cubit.dart';

import '../models/weather.dart';
import '../provider/weatherprovider.dart';

class weathersucesbody extends StatelessWidget {
  const weathersucesbody({
    super.key,
    required this.weatherdata,
  });

  final weathermodel? weatherdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherdata!.getThemeColor()!,
        weatherdata!.getThemeColor()[300]!,
        weatherdata!.getThemeColor()[100]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            BlocProvider.of<WeatherCubit>(context).cityname!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Updated at:${weatherdata?.date}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherdata!.getimage()),
              Text(
                '${weatherdata!.temp.toInt()}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('mintemp:${weatherdata!.mintemp.toInt()}'),
                  Text('maxtemp:${weatherdata!.maxtemp.toInt()}')
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(weatherdata?.weathersatatename ?? '')],
          )
        ],
      ),
    );
  }
}
