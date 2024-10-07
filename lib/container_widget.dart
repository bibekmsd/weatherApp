import 'package:flutter/material.dart';
import 'dart:ui';

class WeatherBoxMain extends StatefulWidget {
  final String weatherNow;
  final String temperatureNow;
  // final Widget icon;
  final double textsize;
  final double numbersize;
  final double iconsize;
  final double height;
  final double width;
  final String iconUrl;
  WeatherBoxMain({
    Key? key,
    required this.weatherNow,
    required this.temperatureNow,
    // required this.icon,
    required this.textsize,
    required this.numbersize,
    required this.iconsize,
    required this.height,
    required this.width,
    required this.iconUrl,
  }) : super(key: key);

  @override
  State<WeatherBoxMain> createState() => _WeatherBoxMainState();
}

class _WeatherBoxMainState extends State<WeatherBoxMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "${widget.temperatureNow}°C",
                    style: TextStyle(
                      fontSize: widget.textsize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                        'https://openweathermap.org/img/wn/${widget.iconUrl}@2x.png',
                      ),
                    ),
                  ),
                  Text(
                    widget.weatherNow,
                    style: TextStyle(
                      fontSize: widget.textsize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
