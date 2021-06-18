import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesAutocompleter {
  PlacesAutocompleter();

  Future<List<String>> getPredictions(String input) async {
    List<String> results = [];
    String apiKey = "AIzaSyBM4Tkf7XAKsNfV3B--WRVxJsO4meVCiLQ";

    // TODO: Default location now is UCSD, need to obtain user coords
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=${input}&location=32.8800649,-117.2362022&radius=100&key=${apiKey}");

    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    var predictions = jsonData["results"];

    for (var result in predictions) {
      print("---type: ${result["formatted_address"].runtimeType}");
      results.add(result["formatted_address"]);
    }

    // Not sure how many results we want to display...
    // if (results.length > 7) return results.take(7);

    return results;
  }
}
