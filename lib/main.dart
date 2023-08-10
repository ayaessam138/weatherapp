import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherpredict/cubits/cubit/weather_cubit.dart';
import 'package:weatherpredict/models/weather.dart';
import 'package:weatherpredict/provider/weatherprovider.dart';
import 'package:weatherpredict/screens/home.dart';
import 'package:weatherpredict/screens/search.dart';
import 'package:provider/provider.dart';
import 'package:weatherpredict/services/weather_service.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(weatherservice());
      },
      child: weather()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              BlocProvider.of<WeatherCubit>(context).weatherdata == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherdata
                      ?.getThemeColor()),
      debugShowCheckedModeBanner: false,
      routes: {
        searchpage.searchpageid: (context) => searchpage(),
        homepage.homepageid: (context) => homepage()
      },
      initialRoute: homepage.homepageid,
    );
  }
}
