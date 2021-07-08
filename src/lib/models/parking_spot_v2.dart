import 'package:google_maps_flutter/google_maps_flutter.dart';

// TODO: Think of how multiple images stored in backend
//         use List<String> for multiple images
class ParkingSpotV2 {
  final String id;
  final LatLng coords;
  final String name;
  // final String description;
  final String address;
  final double price;
  final dynamic height;
  final String imageUrl;
  final double avgRating;
  final int numRatings;
  final bool bought;

  ParkingSpotV2.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'].toString(),
        coords = LatLng(jsonData['lat'], jsonData['lng']),
        name = jsonData['name'],
        address = jsonData['address'],
        price = double.parse(jsonData['price'].toString()),
        imageUrl = jsonData['imageUrl'],
        avgRating = jsonData["avgRating"],
        numRatings = jsonData["numRatings"],
        bought = jsonData["bought"],
        height = double.parse(jsonData["height"].toString()) > 0
            ? double.parse(jsonData["height"].toString())
            : "No limit";
}
