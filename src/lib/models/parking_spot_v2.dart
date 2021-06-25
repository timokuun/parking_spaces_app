import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';

class ParkingSpotV2 {
  final String id;
  final LatLng coords;
  final String name;
  // final String description;
  // final double price;

  // ParkingSpotV2({
  //   this.id,
  //   this.coords,
  //   this.name,
  //   // this.description,
  //   this.price,
  // });

  ParkingSpotV2.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['place_id'],
        coords =
            LatLng(jsonData['location']['lat'], jsonData['location']['lng']),
        name = jsonData['name'];
}
