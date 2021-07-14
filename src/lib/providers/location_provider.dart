import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

class UserLocation extends StateNotifier<LocationData> {
  UserLocation()
      : super(LocationData.fromMap({
          "latitude": 0.0,
          "longitude": 0.0,
        }));

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  LocationData get locationData {
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

    state = await location.getLocation();

    // print(
    //     "_locationData = ${_locationData.latitude}, ${_locationData.longitude}");
  }
}
