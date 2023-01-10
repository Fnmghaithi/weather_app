import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  VoidCallback? updateUI;

  SearchPage({required this.updateUI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 24.0,
              ),
              hintText: 'Enter a city',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
            ),
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;

              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
