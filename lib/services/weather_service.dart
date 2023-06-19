import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_setup/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = '33f0c757745149aa8ad143956232205';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');

    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    // var jsonDataPath = data["forecast"]["forecastday"][0]["day"];
    // WeatherModel weather = WeatherModel(
    //     date: data["location"]["localtime"],
    //     temp: jsonDataPath["avgtemp_c"],
    //     maxTemp: jsonDataPath["maxtemp_c"],
    //     minTemp: jsonDataPath["mintemp_c"],
    //     WeatherSateName: jsonDataPath["condition"]["text"]);

// With Named Constructor in the model we create the object here with one line
    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
