import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude;
  double? longitude;
  Future getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      print(error);
    }
  }
}
