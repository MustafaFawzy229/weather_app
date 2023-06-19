import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_setup/models/weather_model.dart';
import 'package:weather_app_setup/providers/weather_provider.dart';
import 'package:weather_app_setup/services/weather_service.dart';
import 'package:weather_app_setup/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage();

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              hintText: "Enter City Name",
              border: OutlineInputBorder(),
              labelText: "Search",
              suffix: GestureDetector(
                onTap: () async {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                  color: BlocProvider.of<WeatherCubit>(context).weatherModel ==
                          null
                      ? Colors.blue
                      : BlocProvider.of<WeatherCubit>(context)
                          .weatherModel!
                          .getThemeColor(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
