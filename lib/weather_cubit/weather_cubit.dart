import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/models/weather_model.dart';
import 'package:weather_app_setup/services/weather_service.dart';
import 'package:weather_app_setup/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());

    try {
      WeatherModel weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
