import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/utils/colors.dart';

class WeeklyForecastCard extends StatelessWidget {
  final String day;
  final Widget icon;
  final String weeklyForecast;
  final String temp;

  const WeeklyForecastCard({
    super.key,
    required this.day,
    required this.temp,
    required this.icon,
    required this.weeklyForecast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.20,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: primaryColor.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              day,
              style: const TextStyle(
                color: primaryTextColor,
              ),
            ),
            Text(
              weeklyForecast,
              style: GoogleFonts.asapCondensed(
                  fontSize: 12,
                  // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade300),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const FaIcon(FontAwesomeIcons.cloudRain),
            Text(
              '${temp}°C',
              style: const TextStyle(color: primaryTextColor),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
