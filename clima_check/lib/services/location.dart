import 'package:new_geolocation/geolocation.dart';

class Location {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationResult currentLocation = await Geolocation.lastKnownLocation();
      latitude = currentLocation.location.latitude;
      longitude = currentLocation.location.longitude;
    }
    catch (e) {
      print(e);
    }
  }
}




