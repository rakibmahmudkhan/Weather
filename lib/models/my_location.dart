import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? lat;
  double? lon;
  Future getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
    } catch (error) {
      print(error);
    }
  }
}
