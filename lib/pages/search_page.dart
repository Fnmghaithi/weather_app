import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //     child: TextField(
      //       decoration: const InputDecoration(
      //         contentPadding: EdgeInsets.symmetric(
      //           vertical: 30.0,
      //           horizontal: 24.0,
      //         ),
      //         hintText: 'Enter a city',
      //         border: OutlineInputBorder(),
      //         suffixIcon: Icon(Icons.search),
      //         label: Text('Search'),
      //       ),
      //       onSubmitted: (value) {
      //         cityName = value;
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
