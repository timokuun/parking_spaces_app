import 'package:geocoder/geocoder.dart';
// import 'package:http/http.dart';

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

  // Create HTTP obj to make calls to Google Places API
  // (https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${input}&key=${apiKey}&types=address)
  //  will return list of predictions, need to obtain "description" from the result object, put into List<String>

  // Then setState the results to update the autoCompleteDrawer (make an http call in "onChanged" of textField)
}
