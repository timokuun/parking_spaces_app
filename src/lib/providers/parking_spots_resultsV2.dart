import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParkingSpotResults extends StateNotifier<List<ParkingSpotV2>> {
  ParkingSpotResults() : super([]);

  void addResultsFromResponse(dynamic jsonData) {
    clearResults();
    for (var data in jsonData) {
      final spot = ParkingSpotV2.fromJson(data);
      state = [...state, spot];
    }
  }

  void clearResults() {
    state = [];
  }
}
