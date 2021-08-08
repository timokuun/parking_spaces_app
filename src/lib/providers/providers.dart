import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './map_markers_list.dart';
import './user_active_spots.dart';
import './parking_spots_resultsV2.dart';
import './location_provider.dart';
import './http_response_getter.dart';
import './user_info.dart';

// State notifier for list of MapMarkers
final mapMarkerSetProvider = StateNotifierProvider((_) => MapMarkersSet());

// State notifier for list of parking spot results
final parkingSpotResultsProvider =
    StateNotifierProvider((_) => ParkingSpotResults());

// Change notifier for User data (auth, settings, etc...)
final userInfoProvider = ChangeNotifierProvider((_) => UserInfo());

// State notifier for list of parking spot results
final userActiveSpotsProvider = StateNotifierProvider((_) => UserActiveSpots());

// State notifier for Location Data
final userLocationProvider = StateNotifierProvider((_) => UserLocation());

// Future provider to get http response
final httpResponseProvider = FutureProvider<dynamic>((ref) async {
  final allSpots = await httpGetAllSpots();

  // Adds all markers in the response
  ref.read(mapMarkerSetProvider.notifier).addMarkerFromResponse(allSpots);

  // Update list of results
  ref
      .read(parkingSpotResultsProvider.notifier)
      .addResultsFromResponse(allSpots);
});

// Future provider to obtain a specific spot from ID (http call)
final httpSpotFromIdProvider =
    FutureProvider.family<ParkingSpotV2, String>((ref, spotID) async {
  final decodedSpot = await httpGetSpotFromId(spotID);
  final spot = ParkingSpotV2.fromJson(decodedSpot);
  return spot;
});
