import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String WeatherSateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.WeatherSateName});

  // With Named Constructor is Better than with data from internet
  factory WeatherModel.fromJson(dynamic data) {
    var jsonDataPath = data["forecast"]["forecastday"][0]["day"];
    // date = data["location"]["localtime"];
    // temp = jsonDataPath["avgtemp_c"];
    // maxTemp = jsonDataPath["maxtemp_c"];
    // minTemp = jsonDataPath["mintemp_c"];
    // WeatherSateName = jsonDataPath["condition"]["text"];

// Factory constructor solve the problem of null value and retuen object like normal
// constructor it merge the benefits of normal and named constructor.

    return WeatherModel(
        date: data["location"]["localtime"],
        temp: jsonDataPath["avgtemp_c"],
        maxTemp: jsonDataPath["maxtemp_c"],
        minTemp: jsonDataPath["mintemp_c"],
        WeatherSateName: jsonDataPath["condition"]["text"]);
  }

  String getImage() {
    if (WeatherSateName == 'Clear' || WeatherSateName == 'Light Cloud') {
      return "assets/images/clear.png";
    } else if (WeatherSateName == 'Snow' ||
        WeatherSateName == 'Sleet' ||
        WeatherSateName == 'Hail') {
      return "assets/images/snow.png";
    } else if (WeatherSateName == 'Heavy Cloud') {
      return "assets/images/cloudy.png";
    } else if (WeatherSateName == 'Light Rain' ||
        WeatherSateName == 'Heavy Rain' ||
        WeatherSateName == 'Showers' ||
        WeatherSateName == 'Moderate rain') {
      return "assets/images/rainy.png";
    } else if (WeatherSateName == 'Thunder' ||
        WeatherSateName == 'Thunder Storm') {
      return "assets/images/thunderstorm.png";
    } else {
      return "assets/images/clear.png";
    }
  }

  MaterialColor getThemeColor() {
    if (WeatherSateName == 'Clear' || WeatherSateName == 'Light Cloud') {
      return Colors.orange;
    } else if (WeatherSateName == 'Snow' ||
        WeatherSateName == 'Sleet' ||
        WeatherSateName == 'Hail') {
      return Colors.blue;
    } else if (WeatherSateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (WeatherSateName == 'Light Rain' ||
        WeatherSateName == 'Heavy Rain' ||
        WeatherSateName == 'Showers' ||
        WeatherSateName == 'Moderate rain') {
      return Colors.blue;
    } else if (WeatherSateName == 'Thunder' ||
        WeatherSateName == 'Thunder Storm') {
      return Colors.purple;
    } else {
      return Colors.orange;
    }
  }
}
