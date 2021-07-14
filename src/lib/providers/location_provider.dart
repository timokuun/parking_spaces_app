import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

class UserLocation extends StateNotifier<Location> {
  UserLocation() : super(Location());

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Location get state {
    return state;
  }

  void initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    print(
        "_locationData = ${_locationData.latitude}, ${_locationData.longitude}");
  }
}
