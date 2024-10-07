import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:convert'; // For JSON encoding and decoding

class WeatherService {
  final String apiKey = "a11425562f154f69b7644727240610";

  // Fetch current weather
  Future<Map<String, dynamic>> getCurrentWeather(String cityName) async {
    final res = await http.get(
      Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=yes&alerts=yes&solar=yes&wind100kph=yes"),
    );
    return _processResponse(res);
  }

  // Fetch weather forecast
  Future<Map<String, dynamic>> getWeatherForecast(String cityName) async {
    final res = await http.get(
      Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&aqi=yes&alerts=yes&solar=yes&wind100kph=yes"),
    );
    return _processResponse(res);
  }

  // Fetch astronomical data
  Future<Map<String, dynamic>> getAstroData(String cityName) async {
    final res = await http.get(
      Uri.parse(
          "http://api.weatherapi.com/v1/astronomy.json?key=$apiKey&q=$cityName&aqi=yes&alerts=yes&solar=yes&wind100kph=yes"),
    );
    return _processResponse(res);
  }

  // Helper function to process response
  Map<String, dynamic> _processResponse(http.Response res) {
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw res;
    }
  }

  // // Save weather data to SharedPreferences (Local Cache)
  // Future<void> saveWeatherData(String key, Map<String, dynamic> data) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, jsonEncode(data));
  // }

  // // Load weather data from SharedPreferences
  // Future<Map<String, dynamic>?> loadWeatherData(String key) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonData = prefs.getString(key);
  //   if (jsonData != null) {
  //     return jsonDecode(jsonData);
  //   } else {
  //     return null;
  //   }
  // }
}
