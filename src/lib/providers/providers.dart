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
  final response = await getResponse();

  // Adds all markers in the response
  ref.read(mapMarkerSetProvider.notifier).addMarkerFromResponse(response);

  // Update list of results
  ref
      .read(parkingSpotResultsProvider.notifier)
      .addResultsFromResponse(response);
});
