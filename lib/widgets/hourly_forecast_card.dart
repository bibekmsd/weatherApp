import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/utils/colors.dart';

class HourlyForecastCard extends StatelessWidget {
  final String time;
  final Widget icon;
  final String hourlyForecast;
  final String temp;

  const HourlyForecastCard({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
    required this.hourlyForecast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.20,
      child: Card(
        // elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white.withOpacity(0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              time,
              style: GoogleFonts.robotoFlex(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade300),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              hourlyForecast,
              style: GoogleFonts.asapCondensed(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade300),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const FaIcon(
              FontAwesomeIcons.cloudRain,
              color: primaryTextColor,
            ),
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
