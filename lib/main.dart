import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:weather_app/api%20calls/api_key.dart';
import 'package:weather_app/api%20calls/location_service.dart';
import 'package:weather_app/modules/single_weather_page.dart';
import 'package:weather_app/pages/weather_page_manager.dart';

import 'package:weather_app/weather_screen.dart';
import 'package:weather_app/widgets/additional_info_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: lightTheme,
      // darkTheme: darkTheme,
      // themeMode: ThemeMode.system, // Allow system to choose theme mode
      // home: const WeatherScreen(),
      // home: SingleWeatherPage(
      //   backgroundImage: "assets/svg_images/2.svg",
      //   cityName: "Kathmandu",
      //   highTemp: "24",
      //   lowTemp: "14",
      //   temperature: "19",
      //   weatherCondition: "Mostly Clear",
      // ),
      home: WeatherPageManager(),

      // home: WeatherPage(),
    );
  }
}
