import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesAutocompleter {
  //String query = "taipei 101";
  Coordinates coordinate = Coordinates(32.10, 90.50);

  PlacesAutocompleter();

  Future<List<String>> values(String query) async {
    List<String> predictions;
    List<Address> results = await Geocoder.local.findAddressesFromQuery(query);
    results.asMap().forEach((index, element) {
      predictions.insert(index, element.addressLine);
    });

    // predictions.map((e) => print("-------results: " + predictions[0]));

    // Only want first 5 predictions
    return predictions.take(5);
  }

  Future<String> obtainPredictions(String input) async {
    String apiKey = "AIzaSyBM4Tkf7XAKsNfV3B--WRVxJsO4meVCiLQ";
    // var url = Uri.parse(
    //     "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${input}&key=${apiKey}&types=address");

    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/js?libraries=places&key=${apiKey}");
    // WE USE THIS ONE
    // https://maps.googleapis.com/maps/api/place/textsearch/json?query=UCSD&location=42.3675294,-71.186966&radius=10000&key=AIzaSyBM4Tkf7XAKsNfV3B--WRVxJsO4meVCiLQ

    var response = await http.get(url);
    // var jsonData = json.decode(response.body);
    print("")
    print(response.body);
    // var predictions = jsonData["predictions"];
    // print(predictions);
    // print("----- predictions size: ${predictions.length}");

    //print(response[0]["predictions"]);
    // var predResults = [];

    // print("-----predResults size: ${predResults.length}");
    // Observe what the body looks like, then return addresses as List<String>
    return "nice";
  }
  // Create HTTP obj to make calls to Google Places API
  // (https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${input}&key=${apiKey}&types=address)
  //  will return list of predictions, need to obtain "description" from the result object, put into List<String>

  // Then setState the results to update the autoCompleteDrawer (make an http call in "onChanged" of textField)
}
