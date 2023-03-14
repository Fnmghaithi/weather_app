import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBody(weatherData: weatherData, cityName: cityName);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Something went wrong please try again'),
            );
          } else {
            return const DefaultBody();
          }
        },
      ),
      // body: true
      // ? Center(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(
      //           'there is no weather 😔 start',
      //           style: TextStyle(
      //             fontSize: 30,
      //           ),
      //         ),
      //         Text(
      //           'searching now 🔍',
      //           style: TextStyle(
      //             fontSize: 30,
      //           ),
      //         )
      //       ],
      //     ),
      //   )
      // : Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           weatherData!.getThemeColor(),
      //           weatherData!.getThemeColor()[200]!,
      //           weatherData!.getThemeColor()[100]!,
      //         ],
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //       ),
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const Spacer(flex: 3),
      //         Text(
      //           cityName!,
      //           style: TextStyle(
      //             fontSize: 32,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         Text(
      //           'updated at: ${weatherData!.date.hour}:${weatherData!.date.minute}',
      //           style: TextStyle(
      //             fontSize: 22,
      //           ),
      //         ),
      //         const Spacer(),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Image.asset(weatherData!.getImage()),
      //             Text(
      //               weatherData!.temp.toInt().toString(),
      //               style: TextStyle(
      //                 fontSize: 32,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Column(
      //               children: [
      //                 Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
      //                 Text('maxTemp : ${weatherData!.minTemp.toInt()}'),
      //               ],
      //             ),
      //           ],
      //         ),
      //         const Spacer(),
      //         Text(
      //           weatherData?.weatherStateName ?? '',
      //           style: TextStyle(
      //             fontSize: 32,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         const Spacer(flex: 5),
      //       ],
      //     ),
      //   ),
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    Key? key,
    required this.weatherData,
    required this.cityName,
  }) : super(key: key);

  final WeatherModel? weatherData;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[200]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            cityName!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at: ${weatherData!.date.hour}:${weatherData!.date.minute}',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                  Text('maxTemp : ${weatherData!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherData?.weatherStateName ?? '',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
