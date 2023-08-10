import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherpredict/cubits/cubit/weather_cubit.dart';

import 'package:weatherpredict/models/weather.dart';
import 'package:weatherpredict/provider/weatherprovider.dart';
import 'package:weatherpredict/services/weather_service.dart';

class searchpage extends StatelessWidget {
  searchpage();
  static String searchpageid = 'searchpage';
  String? cityname;
  // VoidCallback? updateui;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              cityname = value;
            },
            onSubmitted: (value) async {
              cityname = value;
              // weatherservice service = weatherservice();
              // weathermodel? weatherdata =
              //     await service.getweather(cityname: cityname!);
              // // weathergetdata = weatherdata;
              // updateui!();
              // Provider.of<weatherprovider>(context, listen: false).weatherdata =
              //     weatherdata;
              // Provider.of<weatherprovider>(context, listen: false).cityname =
              //     cityname;
              BlocProvider.of<WeatherCubit>(context)
                  .getweather(cityname: cityname!);
              BlocProvider.of<WeatherCubit>(context).cityname = cityname;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: Text('Search'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      weatherservice service = weatherservice();
                      weathermodel? weatherdata =
                          await service.getweather(cityname: cityname!);
                      // weathergetdata = weatherdata;
                      // updateui!();
                      Provider.of<weatherprovider>(context, listen: false)
                          .weatherdata = weatherdata;
                      Provider.of<weatherprovider>(context, listen: false)
                          .cityname = cityname;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                hintText: 'Enter City name',
                border: OutlineInputBorder()),
          ),
        ),
      ],
    ));
  }
}

weathermodel? weathergetdata;
