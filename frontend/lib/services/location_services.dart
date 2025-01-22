import 'package:geolocator/geolocator.dart';

class LocationService{
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await geolocator.requestPermission();
    if (permission == LocationPermission.denied){
      permission = await geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await geolocator.getCurrentLocation(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}