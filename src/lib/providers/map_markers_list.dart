import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

class MapMarkersSet extends StateNotifier<Set<Marker>> {
  MapMarkersSet() : super(HashSet());

  // Append the new pin to the list of MapMarkers
  void addMarker(Marker pin) {
    //state = {...state, pin};
    state.add(pin);
  }

  // Adds marker from decoded json response
  void addMarkerFromResponse(dynamic jsonData) {
    clearSet();
    for (var data in jsonData) {
      addMarker(
        Marker(
          markerId: MarkerId("${data["id"]}"),
          position: LatLng(data["lat"], -data["lng"]),
          infoWindow: InfoWindow(
            title: data["name"],
            snippet: data["description"],
          ),
        ),
      );
    }
  }

  // Clear the list of MapMarkers
  void clearSet() {
    state = HashSet();
  }
}
