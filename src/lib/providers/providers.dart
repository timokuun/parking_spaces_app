import 'package:flutter_riverpod/flutter_riverpod.dart';

import './map_markers_list.dart';
import './parking_spots_resultsV2.dart';
import './http_response_getter.dart';

// State notifier for list of MapMarkers
final mapMarkerSetProvider = StateNotifierProvider((_) => MapMarkersSet());

// State notifier for list of parking spot results
final parkingSpotResultsProvider =
    StateNotifierProvider((_) => ParkingSpotResults());

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

// // Provides instance of HttpResponseGetter that makes the HTTP request
// final httpGetterProvider = Provider((ref) => HttpResponseGetter());

// // Future provider allows us to render different widgets for each state that
// //  future will be in (data, loading, error)
// // Here, we will return a decoded response.body
// // Using ".family" to pass in the URL
// final httpResponseProvider =
//     FutureProvider.family<dynamic, String>((ref, url) async {
//   final httpGetter = ref.read(httpGetterProvider);
//   return httpGetter.getResponse(url);
// });
