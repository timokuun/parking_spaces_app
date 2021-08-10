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

// Default constructor used to create dummy favorites tab
  const ParkingSpotV2(
      {this.id,
      this.coords,
      this.name,
      this.address,
      this.price,
      this.height,
      this.imageUrl,
      this.avgRating,
      this.numRatings,
      this.bought});

  ParkingSpotV2.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'].toString(),
        coords = LatLng(jsonData['lat'], jsonData['lng']),
        name = jsonData['name'],
        address = jsonData['address'],
        price = double.parse(jsonData['price'].toString()),
        imageUrl = jsonData['imageUrl'],
        avgRating = double.parse(jsonData["avgRating"].toString()),
        numRatings = jsonData["numRatings"],
        bought = jsonData["bought"],
        height = double.parse(jsonData["height"].toString()) > 0
            ? double.parse(jsonData["height"].toString())
            : "No limit";
}

const spot1V2 = ParkingSpotV2(
  id: "1",
  coords: LatLng(32.8801, 117.234),
  name: "UCSD",
  address: "9500 Gilman Drive, La Jolla, CA",
  price: 7.0,
  height: 150,
  imageUrl:
      "https://ucsdnews.ucsd.edu/news_uploads/1280x800_210310-Rainbow7DSC_8071-UCSanDiego-ErikJepsen-1.jpg",
  avgRating: 4.1,
  numRatings: 28,
  bought: true,
);

// Dummy ParkingSpotV2 list using for testing
List<ParkingSpotV2> spotsV2 = [spot1V2, spot1V2, spot1V2, spot1V2];
