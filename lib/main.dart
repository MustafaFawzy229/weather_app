import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_setup/pages/home_page.dart';
import 'package:weather_app_setup/providers/weather_provider.dart';
import 'package:weather_app_setup/services/weather_service.dart';
import 'package:weather_app_setup/weather_cubit/weather_cubit.dart';

void main() {
  runApp(
    BlocProvider(
        create: (context) {
          return WeatherCubit(WeatherService());
        },
        child: WeatherApp()),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.orange
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
