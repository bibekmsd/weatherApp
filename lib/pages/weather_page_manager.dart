import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/api%20calls/location_service.dart';
import 'package:weather_app/modules/single_weather_page.dart';
import 'package:weather_app/pages/add_city.dart';

class WeatherPageManager extends StatefulWidget {
  WeatherPageManager({super.key});

  @override
  State<WeatherPageManager> createState() => _WeatherPageManagerState();
}

class _WeatherPageManagerState extends State<WeatherPageManager> {
  final LocationService _locationService = LocationService();
  final PageController _pageController = PageController();
  int _currentIndex = 0; // To track the current page index
  List<Widget> weatherPages = []; // To hold weather pages

  @override
  void initState() {
    super.initState();
    _fetchWeatherPages(); // Fetch weather pages on initialization
  }

  // Fetch weather pages without using FutureBuilder
  void _fetchWeatherPages() async {
    String cityName = await _locationService.getCityName();

    weatherPages = [
      SingleWeatherPage(
        backgroundImage: "assets/svg_images/1.svg",
        cityName: cityName,
        highTemp: "24",
        lowTemp: "14",
        temperature: "19",
        weatherCondition: "Mostly Clear",
      ),
      SingleWeatherPage(
        backgroundImage: "assets/svg_images/3.svg",
        cityName: "Patan",
        highTemp: "28",
        lowTemp: "18",
        temperature: "22",
        weatherCondition: "Partly Cloudy",
      ),
      SingleWeatherPage(
        backgroundImage: "assets/svg_images/4.svg",
        cityName: "Patan",
        highTemp: "28",
        lowTemp: "18",
        temperature: "22",
        weatherCondition: "Partly Cloudy",
      ),
    ];

    setState(() {}); // Update UI after fetching pages
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Display the PageView directly using weatherPages
          PageView.builder(
            controller: _pageController,
            itemCount: weatherPages.length, // Directly access list length
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index; // Update current index on page change
              });
            },
            itemBuilder: (context, index) {
              return weatherPages[index]; // Access the weather pages directly
            },
          ),
          // Bottom navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.1, // Increased height for better touch area
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.map),
                      ),
                      Spacer(),
                      ...List.generate(
                        weatherPages.length, // Use the length of the pages list
                        (index) => buildDot(index, _currentIndex),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AddCity();
                            },
                          ));
                        },
                        icon: FaIcon(FontAwesomeIcons.list),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, int currentIndex) {
    if (index == 0) {
      // If it's the first index, return the location icon
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 20, // Adjust the size for the icon
        width: 20, // Adjust the size for the icon
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Icon(
          Icons.location_on,
          color: currentIndex == index ? Colors.white : Colors.grey,
          size: 20, // Adjust icon size as needed
        ),
      );
    } else {
      // For other indexes, return the dot
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 5,
        width: currentIndex == index ? 12 : 10,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }
  }
}
