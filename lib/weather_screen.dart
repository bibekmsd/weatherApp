// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:conversion_units/conversion_units.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additiona_info.dart';
import 'package:weather_app/container_widget.dart';
import 'package:weather_app/secrets.dart';
import 'package:weather_app/widget2.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 200;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  final naam = TextEditingController();
  String cityName = "Kathmandu";
  Future<Map<String, dynamic>> getCurrentWeather() async {
    final res = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPTKey"),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data;
    } else {
      throw Text("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather App",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue)),
          centerTitle: true,
          actions: [
            SearchBar(
              constraints: BoxConstraints.tightFor(height: 30, width: 200),
              hintText: "Search",
              controller: naam,
              onSubmitted: (value) {
                setState(() {
                  cityName = value;
                });
              },
            ),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh)),
          ],
        ),
        body: FutureBuilder(
            future: getCurrentWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const LinearProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(child: Text('No data available'));
              }
              final data = snapshot.data;
              if (data == null) {
                return Center(child: Text('No data available'));
              }

              if (snapshot.hasData) {
                /// Data from JSON
                final data = snapshot.data!;
                final currentWeatherData = data['list'][0];
                final currentTemp = (currentWeatherData['main']['temp']);
                final currentTempCelcius = Kelvin.toCelsius(currentTemp);
                final currentSky = (currentWeatherData['weather'][0]['main']);
                final currentPressure = currentWeatherData['main']['pressure'];
                final windSpeed = currentWeatherData['wind']['speed'];
                final currentHumidity = currentWeatherData['main']['humidity'];
                final currentVisibility = currentWeatherData['visibility'];
                final mainIconType = (currentWeatherData['weather'][0]['icon']);
                // print(data);
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    // physics: const PageScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              size: 22,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                cityName,
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        WeatherBoxMain(
                          iconUrl: mainIconType.toString(),
                          // textColor: Colors.white,
                          weatherNow: currentSky,
                          temperatureNow: currentTempCelcius.toStringAsFixed(1),
                          // icon: IconsFunction(currentSky),
                          textsize: 24,
                          iconsize: 64,
                          numbersize: 32,
                          // height: 200,
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Weather Forecast",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                        //Forecast
                        const SizedBox(height: 15),

                        SizedBox(
                          // height: 220,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              final hourlyForecast = data['list'][index + 1];
                              // final hourlySky =
                              //     data['list'][index + 1]['weather'][0]['main'];
                              final hourlySky = data['list'][index + 1]
                                  ['weather'][0]['description'];

                              final shourlyTemp =
                                  hourlyForecast['main']['temp'];
                              final hourlyTemp = Kelvin.toCelsius(shourlyTemp);
                              final dateNow =
                                  DateTime.parse(hourlyForecast['dt_txt']);
                              final time =
                                  DateTime.parse(hourlyForecast['dt_txt']);
                              final iconType =
                                  data['list'][index + 1]['weather'][0]['icon'];
                              print(data['list'][index + 1]['weather'][0]);
                              print(hourlySky);

                              return WeatherBoxRow(

                                  // DateNow: dateNow.toString(),
                                  DateNow:
                                      DateFormat.MMMMEEEEd().format(dateNow),
                                  weatherNow: hourlySky,
                                  temperatureNow: hourlyTemp.toStringAsFixed(1),
                                  // icon: IconsFunction(hourlySky),
                                  iconUrl: iconType.toString(),
                                  textsize: 28,
                                  tempsize: 22,
                                  timesize: 32,
                                  numbersize: 30,
                                  iconsize: 48,
                                  // height: 200,
                                  // width: 180,
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  width:
                                      MediaQuery.of(context).size.height * 0.20,
                                  timeNow: DateFormat.j().format(time));
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Additional Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AdditionaInfoBox(
                                textSize: 24,
                                icon: Icons.water_drop,
                                value: "${currentHumidity.toString()} %",
                                information: "Humidity",
                              ),
                              AdditionaInfoBox(
                                textSize: 24,
                                icon: Icons.air,
                                value: "${windSpeed.toString()} kph",
                                information: "Wind Speed",
                              ),
                              AdditionaInfoBox(
                                textSize: 24,
                                icon: Icons.beach_access,
                                value: " ${currentPressure.toString()} hPa",
                                information: "Pressure",
                              ),
                              AdditionaInfoBox(
                                textSize: 24,
                                icon: Icons.visibility_outlined,
                                value:
                                    "${(currentVisibility / 10000).toString()} km",
                                information: "Visibility",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
                //*
              } else {
                return CircularProgressIndicator.adaptive();
              }
            }),
      ),
    );
  }
}
