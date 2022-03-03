import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  // Location({required this.latitude, required this.logitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      print("meriException:$e");
    }
  }
}
