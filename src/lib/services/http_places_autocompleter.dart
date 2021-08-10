import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesAutocompleter {
  PlacesAutocompleter();

  // TODO: Uncomment correct api key

  Future<List<dynamic>> getPredictions(String input) async {
    // TODO: Watch out for the fake key!
    // Andre API key
    // String apiKey = "AIzaSyBM4Tkf7XAKsNfV3B--WRVxJsO4meVCiLQ";
    // Timo API key
    String apiKey = "AIzaSyBBy8IKL8U_x96TEPRqtZKEx0C2Kbolq_0";

    // String fakeKey = "AIzaSyBM4Tkf7XAKsNfV3B--WRVxJsO4meVCiLZ";

    // TODO: Default location now is UCSD, need to obtain user coords
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=${input}&location=32.8800649,-117.2362022&radius=100&key=${apiKey}");

    var response = await http.get(url);
    var jsonData = json.decode(response.body);

    print("============================jsonData============================");
    print(jsonData);

    var predictions = jsonData["results"];

    return predictions;
  }
}
