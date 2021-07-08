import 'dart:convert';

import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './map_markers_list.dart';
import './user_active_spots.dart';
import './parking_spots_resultsV2.dart';
import './http_response_getter.dart';

// State notifier for list of MapMarkers
final mapMarkerSetProvider = StateNotifierProvider((_) => MapMarkersSet());

// State notifier for list of parking spot results
final parkingSpotResultsProvider =
    StateNotifierProvider((_) => ParkingSpotResults());

// State notifier for list of parking spot results
final userActiveSpotsProvider = StateNotifierProvider((_) => UserActiveSpots());

// Future provider to get http response
final httpResponseProvider = FutureProvider<dynamic>((ref) async {
  final response = await httpGetAllSpots();

  // Adds all markers in the response
  ref.read(mapMarkerSetProvider.notifier).addMarkerFromResponse(response);

  // Update list of results
  ref
      .read(parkingSpotResultsProvider.notifier)
      .addResultsFromResponse(response);
});

// Future provider to obtain a specific spot from ID (http call)
final httpSpotFromIdProvider =
    FutureProvider.family<ParkingSpotV2, String>((ref, spotID) async {
  final response = await httpGetSpotFromId(spotID);
  final decodedSpot = jsonDecode(response.body);

  final spot = ParkingSpotV2.fromJson(decodedSpot);
  return spot;
});
