import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/additional_info_card.dart';
import 'package:weather_app/widgets/hourly_forecast_card.dart';
import 'package:weather_app/widgets/weekly_forecast.dart';

class DraggableSheetBanako extends StatefulWidget {
  const DraggableSheetBanako({super.key});

  @override
  State<DraggableSheetBanako> createState() => _DraggableSheetBanakoState();
}

class _DraggableSheetBanakoState extends State<DraggableSheetBanako> {
  bool isHourly = true;
  List<AdditionalInfoCard> cards = [
    AdditionalInfoCard(
      centerWidget: Text(""),
      header: "UV INDEX",
      data: "0",
      unit: "Low",
      description: "Low for the rest of the day.",
      headerIcon: Icon(Icons.wb_sunny_outlined),
      // color: Colors.blue.shade50,
    ),
    // Sunset Card
    AdditionalInfoCard(
      centerWidget: Text(""),
      header: "SUNSET",
      data: "5:45 PM",
      unit: "",
      description: "Sunrise: 5:59 AM",
      headerIcon: Icon(Icons.wb_sunny),
      // color: Colors.orange.shade100,
    ),
    // Wind Card
    AdditionalInfoCard(
      centerWidget: Text(""),
      header: "WIND",
      data: "4 km/h",
      unit: "",
      description: "Gusts: 9 km/h WNW",
      headerIcon: Icon(Icons.air),
      // color: Colors.blue.shade100,
    ),
    // Moon Phase Card
    AdditionalInfoCard(
      centerWidget: Stack(
        children: [
          Image(
            image: NetworkImage(
                "https://i.pinimg.com/originals/c9/f4/97/c9f497f2d2ce8c9af2d0a1fa047fcbee.jpg"),
          ),
          Container(
            // color: Colors.transparent,
            color: Colors.black.withOpacity(0.7),
          )
        ],
      ),
      // centerWidget: CircleAvatar(
      //   radius: 64,
      //   backgroundImage: NetworkImage(
      //       scale: BorderSide.strokeAlignOutside,
      //       "https://i.pinimg.com/originals/07/cb/13/07cb137eb8e9dc533a9ecade295ad606.png"),
      // ),

      // centerWidget: Image(
      // fit: BoxFit.fill,
      // image: NetworkImage(
      //  const primaryTextColor = Colors.white;
      // ),
      // ),
      header: "WAXING CRESCENT",
      data: "",
      unit: "",
      description: "Moonset: 6:59 PM",
      headerIcon: Icon(Icons.brightness_2_outlined),
      // color: Colors.grey.shade200,
    ),
    // Humidity Card
    AdditionalInfoCard(
        centerWidget: Text(""),
        header: "HUMIDITY",
        data: "75%",
        unit: "",
        description: "The dew point is 18° right now.",
        headerIcon: Icon(Icons.opacity)
        // color: Colors.blue.shade100,
        ),
    // Visibility Card
    AdditionalInfoCard(
      centerWidget: Text(""),
      header: "VISIBILITY",
      data: "14 km",
      unit: "",
      description: "Clear view.",
      headerIcon: Icon(Icons.remove_red_eye_outlined),
      // color: Colors.brown.shade100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(16.0),
            children: [
              // The draggable indicator
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Forecast header (Hourly/Weekly toggle)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isHourly = true),
                    child: Text(
                      "Hourly Forecast",
                      style: GoogleFonts.asapCondensed(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isHourly ? primaryTextColor : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => isHourly = false),
                    child: Text(
                      "Weekly Forecast",
                      style: GoogleFonts.asapCondensed(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: !isHourly ? primaryTextColor : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Horizontal forecast list
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.18, // Fixed height for horizontal list
                child: isHourly
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          HourlyForecastCard(
                            time: "9 AM",
                            temp: "19",
                            icon: Icon(Icons.wb_sunny),
                            hourlyForecast: "Sunny",
                          ),
                          HourlyForecastCard(
                            time: "10 AM",
                            temp: "19",
                            icon: Icon(Icons.wb_sunny),
                            hourlyForecast: "Sunny",
                          ),
                        ],
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          WeeklyForecastCard(
                            day: "SUN",
                            temp: "19",
                            icon: Icon(Icons.wb_sunny),
                            weeklyForecast: "Sunny",
                          ),
                          WeeklyForecastCard(
                            day: "MON",
                            temp: "19",
                            icon: Icon(Icons.wb_sunny),
                            weeklyForecast: "Cloudy",
                          ),
                        ],
                      ),
              ),
              // const SizedBox(height: 20),

              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  mainAxisSpacing: 5, // Space between rows
                  crossAxisSpacing: 5, // Space between columns
                  // childAspectRatio:
                  //     0.7, // Adjust ratio to control height vs width of each card
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: cards[index], // Display your AdditionalInfoCard
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
