import 'package:flutter/material.dart';
import 'package:weather_app/api%20calls/api_call.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherService _weatherService = WeatherService();

  Map<String, dynamic>? _currentWeather;
  Map<String, dynamic>? _forecast;
  Map<String, dynamic>? _astroData;

  @override
  void initState() {
    super.initState();

    _fetchWeatherData();
  }

  // Fetch data from the API and save it to cache
  Future<void> _fetchWeatherData() async {
    try {
      final currentWeather = await _weatherService.getCurrentWeather('Nepal');
      final forecast = await _weatherService.getWeatherForecast('Nepal');
      final astroData = await _weatherService.getAstroData('Nepal');

      // Save data to cache

      setState(() {
        _currentWeather = currentWeather;
        _forecast = forecast;
        _astroData = astroData;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: _currentWeather == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(
                    'Current Weather: ${_currentWeather?['current']['temp_c']}°C'),
                Text(
                    'Forecast: ${_forecast?['forecast']['forecastday'][0]['day']['condition']['text']}'),
                Text(
                    'Astro Data: ${_astroData?['astronomy']['astro']['sunrise']}'),
              ],
            ),
    );
  }
}
