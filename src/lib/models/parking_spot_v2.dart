import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingSpotV2 {
  final String id;
  final LatLng coords;
  final String name;
  // final String description;
  final String address;
  final double price;
  final String imageUrl;

  ParkingSpotV2.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'].toString(),
        coords = LatLng(jsonData['lat'], jsonData['lng']),
        name = jsonData['name'],
        address = jsonData['address'],
        price = double.parse(jsonData['price'].toString()),
        imageUrl = jsonData['imageUrl'];
}
