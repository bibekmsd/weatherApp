import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Position> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: AndroidSettings(accuracy: LocationAccuracy.best),
      // desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getCityName() async {
    try {
      Position position = await getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      return placemarks[0].locality ?? "Unknown City";
    } catch (e) {
      print('Error getting city name: $e');
      return "Error fetching city";
    }
  }
}


// String _cityName = "City Name"; // Default loading text

// final LocationService _locationService = LocationService();

// @override
// void initState() {
//   super.initState();
//   _fetchCity();
// }

// Future<void> _fetchCity() async {
//   try {
//     String cityName = await _locationService.getCityName();
//     setState(() {
//       _cityName = cityName;
//     });
//   } catch (e) {
//     setState(() {
//       _cityName = "Error fetching city";
//     });
//   }
// }
