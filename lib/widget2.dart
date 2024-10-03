import 'package:flutter/material.dart';
import 'dart:ui';

class WeatherBoxRow extends StatefulWidget {
  // final Color textColor;
  // final Color backgroundColor;
  final String weatherNow;
  final String timeNow;
  final String DateNow;
  final String temperatureNow;
  final String iconUrl;
  // final Widget icon;
  final double textsize;
  final double tempsize;
  final double timesize;
  final double numbersize;
  final double iconsize;
  final double height;
  final double width;

  const WeatherBoxRow({
    Key? key,
    // required this.textColor,
    // required this.backgroundColor,
    required this.weatherNow,
    required this.temperatureNow,
    // required this.icon,
    required this.textsize,
    required this.tempsize,
    required this.timesize,
    required this.numbersize,
    required this.iconsize,
    required this.height,
    required this.width,
    required this.timeNow,
    required this.DateNow,
    required this.iconUrl,
  }) : super(key: key);

  @override
  State<WeatherBoxRow> createState() => _WeatherBoxRowState();
}

class _WeatherBoxRowState extends State<WeatherBoxRow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(widget.DateNow),
                    Text(
                      widget.timeNow,
                      style: TextStyle(
                        fontSize: widget.timesize,
                        fontWeight: FontWeight.w500,
                        // color: widget.textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.weatherNow,
                      style: TextStyle(
                        fontSize: widget.textsize,
                        // maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        // color: widget.textColor,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          'https://openweathermap.org/img/wn/${widget.iconUrl}@2x.png',
                        ),
                      ),
                    ),
                    Text(
                      "${widget.temperatureNow}°C",
                      style: TextStyle(
                        fontSize: widget.tempsize,
                        fontWeight: FontWeight.w500,
                        // color: widget.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
