import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/colors.dart';

class AddCity extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  AddCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.do_not_disturb_on_outlined))
        ],
        centerTitle: false,
        title: Text("Weather"),
        scrolledUnderElevation: 13,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _searchController,
                  maxLines: 1,
                  autocorrect: true,
                  decoration: InputDecoration(
                    filled: true, // Fill the background
                    fillColor: Colors.white, // Background color
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey, // Icon color
                    ),
                    hintText: "Search for city or airport",
                    hintStyle: TextStyle(
                      color: Colors.grey[600], // Hint text color
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Rounded corners
                      borderSide: BorderSide.none, // No border
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 20.0), // Padding inside the text field
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg_images/1.svg", // Make the background image customizable
                  // fit: BoxFit.fitWidth,
                  height: 400,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
