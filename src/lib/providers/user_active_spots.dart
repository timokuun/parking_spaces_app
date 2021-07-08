import 'dart:convert';

import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

class UserActiveSpots extends StateNotifier<List<ParkingSpotV2>> {
  // Init list from DB
  UserActiveSpots() : super([]) {
    loadList();
  }

  // TODO: Use userID to parse DB for their spots
  Future<void> loadList() async {
    final url = Uri.parse("http://10.0.2.2:3000/active-spots");
    final response = await http.get(url, headers: <String, String>{
      "userId": "1",
    });

    final decodedData = jsonDecode(response.body);
    print(decodedData);
    addResultsFromResponse(decodedData);
  }

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
