import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class AdditionalInfoCard extends StatelessWidget {
  final String header;
  final String description;
  final Widget headerIcon;
  final Widget centerWidget;
  final String data;
  final String unit;

  const AdditionalInfoCard({
    super.key,
    required this.header,
    required this.description,
    required this.headerIcon,
    required this.centerWidget,
    required this.data,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size to add some minimal responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    // Use different font sizes based on screen width to manage very large or small screens
    double headerFontSize = screenWidth < 350 ? 16 : 18;
    double descriptionFontSize = screenWidth < 350 ? 14 : 16;
    double dataFontSize = screenWidth < 350 ? 26 : 32;
    double unitFontSize = screenWidth < 350 ? 14 : 16;

    return Card(
      color: primaryColor.withOpacity(0.20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          // Center widget occupies the full space of the card
          Positioned.fill(
            child: Center(
              child: centerWidget,
            ),
          ),
          // Overlaying widgets
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Wrap header and description in a separate column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        headerIcon,
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            header,
                            style: TextStyle(
                              color: primaryTextColor,
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                            maxLines: 1, // Limit to one line
                          ),
                        ),
                      ],
                    ),
                    // Directly place the description below the header without any spacing
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: descriptionFontSize,
                        // color: Colors.grey[600],
                        color: secondaryTextColor,
                      ),
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                      maxLines: 2, // Limit to one line
                    ),
                  ],
                ),
                // Space for the data and unit text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data,
                      style: TextStyle(
                        fontSize: dataFontSize,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      unit,
                      style: TextStyle(
                        fontSize: unitFontSize,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
