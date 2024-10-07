import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/modules/draggable_sheet.dart';

class SingleWeatherPage extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String weatherCondition;
  final String highTemp;
  final String lowTemp;
  final String backgroundImage;

  const SingleWeatherPage({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.highTemp,
    required this.lowTemp,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Background Image
          SvgPicture.asset(
            backgroundImage, // Make the background image customizable
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Opacity Layer
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          // City info and other details
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                // City Name
                Text(
                  cityName,
                  style: GoogleFonts.lato(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                // Temperature
                Text(
                  "$temperature°C",
                  style: GoogleFonts.abel(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                // Weather Condition
                Text(
                  weatherCondition,
                  style: GoogleFonts.asapCondensed(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade300),
                ),
                // High and Low Temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "H: $highTemp°",
                      style: GoogleFonts.asapCondensed(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "L: $lowTemp°",
                      style: GoogleFonts.asapCondensed(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bottom sheet
          SafeArea(
            minimum: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1),
            child: const DraggableSheetBanako(),
          ),
        ],
      ),
    );
  }
}
