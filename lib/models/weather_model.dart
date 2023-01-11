import 'package:flutter/material.dart';

class WeatherModel {
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      // date: data['location']['localtime'],

      date: DateTime.parse(DateTime.now().toString()),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return Colors.yellow;
    } else if (weatherStateName == 'Patchy rain possible') {
      return Colors.lightBlue;
    } else {
      return Colors.blue;
    }
  }
}
