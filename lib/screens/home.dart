import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherpredict/cubits/cubit/weather_cubit.dart';
import 'package:weatherpredict/models/weather.dart';
import 'package:weatherpredict/screens/search.dart';

import '../provider/weatherprovider.dart';
import '../weidgets/weatherdefault.dart';
import '../weidgets/weathersucessbody.dart';

class homepage extends StatelessWidget {
  static String homepageid = 'homepage';

  @override
//   State<homepage> createState() => _homepageState();
// }

  weathermodel? weatherdata;

// class _homepageState extends State<homepage> {
//   void updateui() {
//     setState(() {});
//   }

  @override
  Widget build(BuildContext context) {
    // var weatherdata = Provider.of<weatherprovider>(context).weatherdata;
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return searchpage(
                        // updateui: updateui,
                        );
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is Weatherlodaing) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Weathersucess) {
            return weathersucesbody(weatherdata: state.weathersucessdata);
          } else if (state is Weatherfail) {
            return Center(child: Text('Somthing Wrong,Please Try Again'));
          } else {
            return weatherdeafultbody();
          }
        }));
  }
}
